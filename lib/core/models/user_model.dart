

class UserModel {
  String? id;
  String facultad;
  String tipoUsuario;
  String genero;
  int edad;
  String idDispositivo;
  String? email;
  String? tokenUser;

  UserModel({
    this.id,
    required this.facultad,
    required this.tipoUsuario,
    required this.genero,
    required this.edad,
    required this.idDispositivo,
    required this.email,
    this.tokenUser
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

