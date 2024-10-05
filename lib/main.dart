import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mary_cruz_app/core/config/routes/global_route_get.dart';
import 'package:mary_cruz_app/core/theme/theme_data/global_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mary Cruz App',
      themeMode: ThemeMode.light,
      theme: GlobalThemeData.lightThemeData,
      darkTheme: GlobalThemeData.darkThemeData,
      debugShowCheckedModeBanner: false,
      getPages: GlobalRouteGet.routes,
      initialRoute: GlobalRouteGet.initialRoute,
    );
  }
}
