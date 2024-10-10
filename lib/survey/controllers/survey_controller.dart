import 'package:get/get.dart';
import 'package:mary_cruz_app/core/entities/question.dart';
import 'package:mary_cruz_app/core/global_controllers/config_controller.dart';
import 'package:mary_cruz_app/core/supabase/supabase_instance.dart';

class SurveyController extends GetxController {
  var questions = [].obs;
  var surveyName = "".obs;

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
    } catch (e) {
      print("Error al obtener las preguntas $e");
      questions.value = [];
    }
  }

  getSurveyName() async {
    try {
      print(configController.currentSurvey.value);
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
}
