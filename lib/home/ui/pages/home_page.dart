import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';
import 'package:mary_cruz_app/home/ui/provider/prueba.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.put(Controller(), permanent: true);

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppbar(
        title: 'Home',
      ),
      drawer: const GlobalSidebar(
        selectedIndex: SideBar.home,
      ),
      body: Obx(() {
        return SingleChildScrollView(
            child: Container(
          width: deviceWidth,
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(controller.name.value),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.changeWord('Hola Mundo');
                },
                child: const Text('Cambiar texto'),
              ),
            ],
          ),
        ));
      }),
    );
  }
}
