

class CommentModel{
  final String? id;
  final String comentario;
  final String facultad;
  final String tipoUsuario;
  final String genero;
  final int edad;
  final String idDispositivo;

  CommentModel({
    this.id,
    required this.comentario,
    required this.facultad,
    required this.tipoUsuario,
    required this.genero,
    required this.edad,
    required this.idDispositivo
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['id'],
      comentario: json['comentario'],
      facultad: json['facultad'],
      tipoUsuario: json['tipo_usuario'],
      genero: json['genero'],
      edad: json['edad'],
      idDispositivo: json['id_dispositivo']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comentario': comentario,
      'facultad': facultad,
      'tipo_usuario': tipoUsuario,
      'genero': genero,
      'edad': edad,
      'id_dispositivo': idDispositivo
    };
  }

}