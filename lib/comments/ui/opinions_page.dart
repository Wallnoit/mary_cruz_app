import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/enums/sidebar.dart';
import '../../core/ui/components/custom_forms/custom_text_area.dart';
import '../../core/ui/components/custom_forms/dropdown.dart';
import '../../core/ui/components/sidebar.dart';
import '../../main.dart';
import '../controllers/opinions_controller.dart';

class OpinionsPage extends StatefulWidget {
  const OpinionsPage({
    super.key,
  });

  @override
  OpinionsPageState createState() => OpinionsPageState();
}

class OpinionsPageState extends State<OpinionsPage> {
  OpinionsController opinionsController =
      Get.put(OpinionsController(), permanent: true);

  List<DropdownData> facultyData = [
    DropdownData(value: '1', display: 'Ingeniería en Sistemas y Electrónica'),
    DropdownData(value: '2', display: 'Opción 2'),
    DropdownData(value: '3', display: 'Opción 3'),
    DropdownData(value: '4', display: 'Opción 4'),
  ];

  List<DropdownData> personTypeData = [
    DropdownData(value: '1', display: 'Estudiante'),
    DropdownData(value: '2', display: 'Administrativo'),
    DropdownData(value: '3', display: 'Profesor'),
  ];

  List<DropdownData> genreData = [
    DropdownData(value: '1', display: 'Masculino'),
    DropdownData(value: '2', display: 'Femenino'),
    DropdownData(value: '3', display: 'Otro'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dinos que Piensas'),
      ),
      drawer: const GlobalSidebar(
        selectedIndex: SideBar.opinions,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
            child: Column(children: [
              Dropdown(
                label: 'Facultad',
                getData: facultyData,
                value: '1',
                height: 50.0,
                expanded: true,
                onSelected: (String newValue) {
                  print('Nuevo valor seleccionado: $newValue');
                },
                enabled: true,
              ),
              const SizedBox(height: 10),
              Dropdown(
                label: 'Soy',
                getData: personTypeData,
                value: '1',
                height: 50.0,
                expanded: true,
                onSelected: (String newValue) {
                  print('Nuevo valor seleccionado: $newValue');
                },
                enabled: true,
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Dropdown(
                      label: 'Genero',
                      getData: genreData,
                      value: '1',
                      height: 50.0,
                      expanded: true,
                      onSelected: (String newValue) {
                        print('Nuevo valor seleccionado: $newValue');
                      },
                      enabled: true,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Dropdown(
                      label: 'Rango de Edad',
                      getData: facultyData,
                      value: '1',
                      height: 50.0,
                      expanded: true,
                      onSelected: (String newValue) {
                        print('Nuevo valor seleccionado: $newValue');
                      },
                      enabled: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomTextArea(label: 'Comentario'),
              Text(opinionsController.name.value),

            ]),
          ),
        );
      }),
    );
  }
}
