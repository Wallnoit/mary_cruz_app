import 'package:get/get.dart';

List<String> personalDataOptions = ['SI', 'NO'];

class OpinionsController extends GetxController {
  var name = 'prueba'.obs;
  var personalDataOptionSelected = personalDataOptions[1].obs;

  void changeWord(String word) {
    name.value = word;
  }

  void changePersonalDataOption(String option) {
    personalDataOptionSelected.value = option;
  }
}
