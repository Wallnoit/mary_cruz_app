import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDialogController extends GetxController {
  final ValueNotifier<String> statusNotifier = ValueNotifier('');
  bool isProcessing = true;
  Icon icon = Icon(Icons.check_circle, color: Colors.green, size: 70);

  void isLoading(bool processing) {
    isProcessing = processing;
    update();
  }

  void updateIcon(Icon newIcon) {
    icon = newIcon;
    update();
  }

  void reloadIcon() {
    icon = Icon(Icons.check_circle, color: Colors.green, size: 70);
    update();
  }

}
