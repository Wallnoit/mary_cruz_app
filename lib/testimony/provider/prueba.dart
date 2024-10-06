import 'package:get/get.dart';

class Controller extends GetxController {
  var name = 'prueba'.obs;

  changeWord(String word) {
    name.value = word;
  }
}
