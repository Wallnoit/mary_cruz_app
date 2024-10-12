import 'package:mary_cruz_app/core/entities/response.dart';

class Question {
  final String id;
  final String title;
  final List<ResponseQuestion> responses;

  Question({
    required this.id,
    required this.title,
    required this.responses,
  });

  factory Question.fromMap(Map<String, dynamic> map) {
    // Asegúrate de que 'respuestas' es una lista antes de intentar mapear
    List<ResponseQuestion> responsesList =
        (map['respuestas'] as List<dynamic>?)?.map((e) {
              return ResponseQuestion.fromMap(e as Map<String, dynamic>);
            }).toList() ??
            [];

  
    return Question(
        id: map['pregunta_id'],
        title: map['pregunta'],
        responses:
            responsesList // Proporcionar una lista vacía si 'respuestas' es nula
        );
  }
}
