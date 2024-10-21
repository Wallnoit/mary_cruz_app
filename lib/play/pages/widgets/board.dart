import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget board(String title, String info) {
  return Expanded(
    child: Container(
      margin: EdgeInsets.all(ScreenUtil().setHeight(2)),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(title,
              style: TextStyle(fontSize: ScreenUtil().setSp(16), fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text(info,
              style: TextStyle(fontSize: ScreenUtil().setSp(15), fontWeight: FontWeight.bold))
        ],
      ),
    ),
  );
}
