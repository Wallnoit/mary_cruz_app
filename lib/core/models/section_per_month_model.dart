

import 'package:mary_cruz_app/core/models/diary_model.dart';

class SectionPerMonthModel {
  int month;
  List<DiaryModel> diaryList;

  SectionPerMonthModel({
    required this.month,
    required this.diaryList,
  });

  @override
  String toString() {
    return 'SectionPerMonthModel{month: $month, diaryList: $diaryList}';
  }
}