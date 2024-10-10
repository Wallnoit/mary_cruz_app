class ResponseQuestion {
  final String id;
  final String title;

  ResponseQuestion({
    required this.id,
    required this.title,
  });

  factory ResponseQuestion.fromMap(Map<String, dynamic> map) {
    return ResponseQuestion(
      id: map['idRespuesta'],
      title: map['respuesta'],
    );
  }
}
