import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mary_cruz_app/core/config/routes/global_route_get.dart';
import 'package:mary_cruz_app/core/global_controllers/config_controller.dart';
import 'package:mary_cruz_app/core/global_controllers/sidebar_controller.dart';
import 'package:mary_cruz_app/core/theme/theme_data/global_theme_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //firebase
  await Firebase.initializeApp(); // Initialize Firebase
  await initFcm();
  // firebase

  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );

  SidebarController controller = Get.put(SidebarController(), permanent: true);
  ConfigController configController =
      Get.put(ConfigController(), permanent: true);

  await configController.getCurrentVersion();
  await controller.getSidebarOptions();
  await configController.getCurrentSurvey();
  await configController.isCompletedSurveyF();


  runApp(const MyApp());
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> createNotificationChannels() async {
  const AndroidNotificationChannel callChannel = AndroidNotificationChannel(
    'channel ID', // 
    'channel name', // 
    description: 'Incoming call notifications',
    importance: Importance.high,
  );

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(callChannel);
}

Future<void> initFcm() async {
  await Firebase.initializeApp();




  createNotificationChannels();

  var initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher_monochrome');
  var initializationSettingsIOS = const DarwinInitializationSettings(); // ios
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(initializationSettings);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
    RemoteNotification? notification = message?.notification;
    AndroidNotification? android = message?.notification?.android;



    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,

        const NotificationDetails(
          android: AndroidNotificationDetails(
           
          'partido_notificaciones', 'notificaciones', importance: Importance.max,
          //'channel.id', 'channel.name',importance: Importance.max,
            priority: Priority.max,
            channelShowBadge: true,
            enableVibration: true,
            enableLights: true,
          showWhen: true,)),
        payload: json.encode(message?.data),
      );
    }
  });

  



}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
              title: 'Mary Cruz App',
              themeMode: ThemeMode.light,
              theme: GlobalThemeData.lightThemeData,
              darkTheme: GlobalThemeData.darkThemeData,
              debugShowCheckedModeBanner: false,
              getPages: GlobalRouteGet.routes,
              initialRoute: GlobalRouteGet.initialRoute,
            ));
  }
}
