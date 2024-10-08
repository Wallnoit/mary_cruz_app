import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mary_cruz_app/core/config/routes/global_route_get.dart';
import 'package:mary_cruz_app/core/theme/theme_data/global_theme_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_ANON_KEY'),
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
