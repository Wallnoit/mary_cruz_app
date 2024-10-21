class DiaryModel {
  final String title;
  final String description;
  final int month;
  final int day;
  final String dayName;
  final String monthName;
  final String timeRange;
  final String place;

  DiaryModel(
      {required this.title,
      required this.description,
      required this.timeRange,
      required this.place,
      required this.month,
      required this.day,
      required this.dayName,
      required this.monthName});

  factory DiaryModel.fromJson(Map<String, dynamic> json) {
    return DiaryModel(
        title: json['title'],
        description: json['description'],
        timeRange: json['time'],
        place: json['place'],
        month: json['month'],
        day: json['day'],
        dayName: json['dayName'],
        monthName: json['dayNumber']);
  }

  @override
  String toString() {
    return 'DiaryModel(title: $title, description: $description, time: $timeRange, place: $place)';
  }
}
