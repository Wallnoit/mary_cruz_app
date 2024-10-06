
import 'package:flutter/cupertino.dart';

String truncateString(String text, int maxLength) {
  if (text.length <= maxLength) {
    return text;
  } else {
    return "${text.substring(0, maxLength)}...";
  }
}
double getDeviceSize(BuildContext context){
  MediaQueryData queryData;
  queryData = MediaQuery.of(context);
  return queryData.size.width;
}

double getContainerWidth(BuildContext context){
  return getDeviceSize(context)*0.91;
}

double getSizedBoxWidth(BuildContext context){
  return getDeviceSize(context)*0.6;
}