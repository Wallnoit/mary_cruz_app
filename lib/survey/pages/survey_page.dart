import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';
import 'package:mary_cruz_app/survey/components/survey_item.dart';
import 'package:mary_cruz_app/survey/controllers/survey_controller.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  SurveyController controller = Get.put(SurveyController(), permanent: true);

  @override
  void initState() {
    super.initState();
    controller.getQuestions();
    controller.getSurveyName();
    // Código de inicialización
    print("Widget inicializado");
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // Agregar algof
            },
            child: const Icon(Icons.send),
          ),
          appBar: const CustomAppbar(
            title: 'Encuestas',
          ),
          drawer: const GlobalSidebar(
            selectedIndex: SideBar.survey,
          ),
          body: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text('Queremos saber\ntu Opinión!',
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          fontWeight: FontWeight.normal,
                        )),
                const SizedBox(height: 15),
                Text(
                  'Contesta las siguientes preguntas de la encuesta "${controller.surveyName}" para ayudarnos a mejorar!',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.normal,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                ),
                const SizedBox(height: 60),
                controller.questions.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        // Usa Column o ListView para mostrar los widgets
                        children: controller.questions.map<Widget>((question) {
                          int index = controller.questions.indexOf(question);
                          return SurveyItem(
                            question: question,
                            questionIndex: index + 1,
                          );
                        }).toList(),
                      ),
              ],
            ),
          )),
        ),
      );
    });
  }
}
