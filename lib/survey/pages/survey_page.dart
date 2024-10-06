import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/auxiliar_button.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';
import 'package:mary_cruz_app/survey/components/survey_item.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  @override
  Widget build(BuildContext context) {
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
                'Contesta las siguientes preguntas para ayudarnos a mejorar!',
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              const SizedBox(height: 60),
              const SurveyItem(
                question: 'Pregunta 1 asdasdadsasda asdadads',
                options: ['Opción 1', 'Opción 2', 'Opción 3'],
                questionIndex: 1,
              ),
              const SizedBox(height: 40),
              const SurveyItem(
                question: 'Pregunta 2',
                options: ['Opción 1', 'Opción 2', 'Opción 3'],
                questionIndex: 2,
              )
            ],
          ),
        )),
      ),
    );
  }
}
