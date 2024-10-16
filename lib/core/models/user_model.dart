

class UserModel {
  String? id;
  String facultad;
  String tipoUsuario;
  String genero;
  int edad;
  String idDispositivo;
  String email;
  String tokenUser;

  UserModel({
    this.id,
    required this.facultad,
    required this.tipoUsuario,
    required this.genero,
    required this.edad,
    required this.idDispositivo,
    required this.email,
    required this.tokenUser
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      facultad: json['facultad'],
      tipoUsuario: json['tipo_usuario'],
      genero: json['genero'],
      edad: json['edad'],
      idDispositivo: json['id_dispositivo'],
      email: json['email'],
      tokenUser: json['token_user']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'facultad': facultad,
      'tipo_usuario': tipoUsuario,
      'genero': genero,
      'edad': edad,
      'id_dispositivo': idDispositivo,
      'email': email,
      'token_user': tokenUser
    };
  }
}


class UserAndCommentModel extends UserModel {
  String opinion;
  UserAndCommentModel({
    required this.opinion,
    String? id,
    required String facultad,
    required String tipoUsuario,
    required String genero,
    required int edad,
    required String idDispositivo,
    required String email,
    required String tokenUser,
  }) : super(
    id: id,
    facultad: facultad,
    tipoUsuario: tipoUsuario,
    genero: genero,
    edad: edad,
    idDispositivo: idDispositivo,
    email: email,
    tokenUser: tokenUser,
  );

  // Conversión de JSON a modelo
  factory UserAndCommentModel.fromJson(Map<String, dynamic> json) {
    return UserAndCommentModel(
      opinion: json['opinion'],
      id: json['id'],
      facultad: json['facultad'],
      tipoUsuario: json['tipo_usuario'],
      genero: json['genero'],
      edad: json['edad'],
      idDispositivo: json['id_dispositivo'],
      email: json['email'],
      tokenUser: json['token_user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'p_opinion': opinion,
      'p_facultad': facultad,
      'p_tipo_usuario': tipoUsuario,
      'p_genero': genero,
      'p_edad': edad,
      'p_id_dispositivo': idDispositivo,
      'p_email': email,
      'p_token_user': tokenUser,
      if (id != null) 'id': id,
    };
  }
}

