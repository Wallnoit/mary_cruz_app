

class CommentModel{
  final String? id;
  final String comentario;
  final String idDispositivo;

  CommentModel({
    this.id,
    required this.comentario,
    required this.idDispositivo
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      comentario: json['comentario'],
      idDispositivo: json['id_dispositivo']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comentario': comentario,
      'id_dispositivo': idDispositivo
    };
  }

}