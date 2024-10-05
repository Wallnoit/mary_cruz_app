import 'package:get/get_navigation/get_navigation.dart';
import 'package:mary_cruz_app/home/ui/pages/home_page.dart';

class GlobalRouteGet {
  static const initialRoute = '/';

  static final List<GetPage> routes = [
    GetPage(
        name: '/', page: () => const HomePage(), transition: Transition.fadeIn),
    
  ];
}
