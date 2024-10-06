import 'package:get/get.dart';

class OpinionsController extends GetxController {
  var name = 'prueba'.obs;

  changeWord(String word) {
    name.value = word;
  }
}
