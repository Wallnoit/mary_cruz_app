import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/entities/question.dart';
import 'package:mary_cruz_app/core/entities/response.dart';
import 'package:mary_cruz_app/core/global_controllers/config_controller.dart';
import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';

class SurveyController extends GetxController {
  var questions = [].obs;
  var surveyName = "".obs;
  var answerQuestions = <Map<String, ResponseQuestion>>[].obs;
  var questionQuantity = 0.obs;

  ConfigController configController = Get.find();

  getQuestions() async {
    try {
      final data = await supabase.rpc('get_preguntas_respuestas',
          params: {'id_encuesta_input': configController.currentSurvey.value});

      final List<Question> questionsList = data
          .map((e) {
            return Question.fromMap(e as Map<String, dynamic>);
          })
          .toList()
          .cast<Question>();

      questions.value = questionsList;

      questionQuantity.value = questionsList.length;
    } catch (e) {
      print("Error al obtener las preguntas $e");
      questions.value = [];
    }
  }

  bool isSurveyCompleted() {
    print("${questionQuantity.value} == ${answerQuestions.length}");

    return questionQuantity.value == answerQuestions.length;
  }

  getSurveyName() async {
    try {
      final data = await supabase
          .from('encuestas')
          .select()
          .eq('id', configController.currentSurvey.value)
          .single();

      surveyName.value = data['titulo'];
    } catch (e) {
      print("Error al obtener el nombre de la encuesta $e");
      surveyName.value = "";
    }
  }

  addAnswer(String idAnswer, ResponseQuestion option) {
    Map<String, ResponseQuestion> answer = {
      idAnswer: option,
    };

    removeAnswer(idAnswer);

    answerQuestions.add(answer);
  }

  removeAnswer(String idAnswer) {
    //buscar si ya existe la respuesta
    int index =
        answerQuestions.indexWhere((element) => element.containsKey(idAnswer));

    if (index != -1) {
      answerQuestions.removeAt(index);
    }
  }

  clearAnswers() {
    answerQuestions.clear();
  }

  getAnswer(String idAnswer) {
    int index =
        answerQuestions.indexWhere((element) => element.containsKey(idAnswer));

    if (index != -1) {
      return answerQuestions[index];
    }

    return "";
  }

  getAnswers() {
    for (var element in answerQuestions) {
      print("$element ");
      print("JOA");
    }
  }

  String getNameAnswer(String idQuestion) {
    Map<String, ResponseQuestion> question = answerQuestions.firstWhere(
        (element) => element.containsKey(idQuestion),
        orElse: () => {});

    print(question);

    if (question.isNotEmpty) {
      return question[idQuestion]?.title ?? "";
    }

    return "";
  }

  getAnswerLength() {
    return answerQuestions.length;
  }

  sendAnswers(String idDevice) async {
    if (!isSurveyCompleted()) {
      Get.snackbar('Error', 'Por favor completa todas las preguntas',
          colorText: Colors.white, backgroundColor: Colors.red, barBlur: 20);
      return false;
    }

    List<Map<String, String>> answerQuestionsToSend = [];

    // Construir la lista de respuestas
    for (var element in answerQuestions) {
      element.forEach((idQuestion, responseQuestion) {
        // Asegúrate de que solo estés enviando la respuesta
        Map<String, String> answer = {'respuesta': responseQuestion.id};
        answerQuestionsToSend.add(answer);
      });
    }

    try {
      await supabase.rpc('guardar_respuestas_seleccionadas', params: {
        'respuestas_json': answerQuestionsToSend,
        'dispositivo_id': idDevice,
        'id_encuesta': configController.currentSurvey.value
      });

      clearAnswers();

      configController.isCompletedSurvey.value = true;

      Get.snackbar('Respuestas enviadas', 'Gracias por participar',
          colorText: Colors.white, backgroundColor: Colors.green);
      return true;
    } catch (e) {
      print("Error al enviar las respuestas: $e");
      Get.snackbar('Error', 'No se pudieron enviar las respuestas',
          colorText: Colors.white, backgroundColor: Colors.red);
      return false;
    }
  }
}
