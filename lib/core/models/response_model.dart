class ResponseQuestionModel {
  final String id;
  final String title;

  ResponseQuestionModel({
    required this.id,
    required this.title,
  });

  factory ResponseQuestionModel.fromMap(Map<String, dynamic> map) {
    return ResponseQuestionModel(
      id: map['idRespuesta'],
      title: map['respuesta'],
    );
  }

  @override
  String toString() => 'ResponseQuestion(id: $id, title: $title)';
}
