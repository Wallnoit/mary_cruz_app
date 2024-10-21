import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/enums/sidebar.dart';
import 'package:mary_cruz_app/core/global_controllers/config_controller.dart';
import 'package:mary_cruz_app/core/models/diary_model.dart';
import 'package:mary_cruz_app/core/ui/components/custom_appbar.dart';
import 'package:mary_cruz_app/core/ui/components/sidebar.dart';
import 'package:mary_cruz_app/home/ui/widgets/diary_item.dart';
import 'package:mary_cruz_app/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool conection = true;

  @override
  void initState() {
    super.initState();

    verificateConection();

    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> result) {
      _updateConnectionStatus(result);
    });
  }

  void verificateConection() async {
    conection = await checkConnectivity();

    if (conection) {
      _isAndroidPermissionGranted();
      _requestPermissions();
      initNotifications();
    }
  }

  Future<bool> checkConnectivity() async {
    List connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.length == 0) {
      return false;
    }

    return connectivityResult[0] == ConnectivityResult.mobile ||
        connectivityResult[0] == ConnectivityResult.wifi;
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) {
    setState(() {
      if (result.length == 0) {
        conection = false;
      } else {
        if (result[0] == ConnectivityResult.mobile ||
            result[0] == ConnectivityResult.wifi) {
          conection = true;
        } else {
          conection = false;
        }
      }
    });
  }

  resultConnectivity() async {
    return await (Connectivity().checkConnectivity());
  }

  initNotifications() async {
    ConfigController configController =
        Get.put(ConfigController(), permanent: true);
    await configController.saveUpdUser();

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      configController.saveUpdUser();
    });
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
    return SafeArea(
      child: Scaffold(
          appBar: conection
              ? const CustomAppbar(
                  title: 'Home',
                )
              : null,
          drawer: const GlobalSidebar(
            selectedIndex: SideBar.home,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Grandes cosas están por venir,',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                Text(
                  'Mantente atento!',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'lib/assets/logo3.png', // Ruta de la imagen
                ),
                const SizedBox(
                  height: 20,
                ),
                DiaryItem(
                  diary: DiaryModel(
                    dayName: 'Lun',
                    day: 01,
                    month: 1,
                    monthName: 'Enero',
                    title: 'Título',
                    description: 'Descripción',
                    timeRange: '10:00 - 12:00',
                    place: 'Lugar xsdfsdfsdfsf',
                  ),
                ),
                Visibility(
                  visible: !conection,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sin conexión a internet',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      Text(
                        'Por favor, verifique su conexión',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
