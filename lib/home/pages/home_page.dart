import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/global_controllers/config_controller.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';
import 'package:mary_cruz_app/home/provider/prueba.dart';
import 'package:mary_cruz_app/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.put(Controller(), permanent: true);

  @override
  void initState() {
    super.initState();
      

    _isAndroidPermissionGranted();
    _requestPermissions();

    initNotifications();



  }

  initNotifications()async{
    ConfigController configController =
      Get.put(ConfigController(), permanent: true);
    await configController.saveUpdUser();
  }

  
  bool _notificationsEnabled = false;

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      setState(() {
        _notificationsEnabled = granted;
      });
    }
  }

    Future<void> _requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission =
          await androidImplementation?.requestNotificationsPermission();
      setState(() {
        _notificationsEnabled = grantedNotificationPermission ?? false;
      });
    }
  }

  

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
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
      ),
    );
  }
}
