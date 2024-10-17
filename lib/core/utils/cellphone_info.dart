//import 'package:device_info_plus/device_info_plus.dart';

import 'package:flutter_device_imei/flutter_device_imei.dart';

Future<String> getDeviceId() async {
  //DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  //AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  String? imei = await FlutterDeviceImei.instance.getIMEI();

  return imei!; //"androidInfo.id";
}
