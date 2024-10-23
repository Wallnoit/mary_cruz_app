

class ChallengeModel {
  final int id;
  final String nombre;
  final String description;
  final String imgUrl;
  final String imgHint;
  final DateTime createdAt;

  ChallengeModel({
    required this.id,
    required this.nombre,
    required this.description,
    required this.imgUrl,
    required this.imgHint,
    required this.createdAt,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'] ,
      nombre: json['nombre'],
      description: json['descripcion'],
      imgUrl: json['img_url'] ?? '',
      imgHint: json['img_hint'] ?? '',
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'description': description,
      'img_url': imgUrl,
      'img_hint': imgHint,
      'created_at': createdAt.toIso8601String(),
    };
  }

  ChallengeModel copyWith({
    int? id,
    String? nombre,
    String? description,
    String? imgUrl,
    String? imgHint,
    DateTime? createdAt,
  }) {
    return ChallengeModel(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      description: description ?? this.description,
      imgUrl: imgUrl ?? this.imgUrl,
      imgHint: imgHint ?? this.imgHint,
      createdAt: createdAt ?? this.createdAt,
    );
  }

}


class ChallengeUserModel{
  final int? id;
  final String idUsuario;
  final String nombre;
  final String telefono;
  final String dataUrL;
  final bool? aprobado;
  final int? ranking;
  final DateTime createdAt;

  ChallengeUserModel({
     this.id,
    required this.idUsuario,
    required this.nombre,
    required this.telefono,
    required this.dataUrL,
    this.aprobado,
    this.ranking,
    required this.createdAt,
  });

  factory ChallengeUserModel.fromJson(Map<String, dynamic> json) {
    return ChallengeUserModel(
      id: json['id'],
      idUsuario: json['id_usuario'],
      nombre: json['nombre'],
      telefono: json['telefono'],
      dataUrL: json['data_url'] ?? '',
      aprobado: json['aprobado'] ?? '',
      ranking: json['ranking'] ?? -1,
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_usuario': idUsuario,
      'nombre': nombre,
      'telefono': telefono,
      'data_url': dataUrL,
      'aprobado': false,
      'ranking': ranking,
      'created_at': createdAt.toIso8601String(),
    };
  }

  ChallengeUserModel copyWith({
    int? id,
    String? idUsuario,
    String? nombre,
    String? telefono,
    String? dataUrL,
    bool? aprobado,
    int? ranking,
    DateTime? createdAt,
  }) {
    return ChallengeUserModel(
      id: id ?? this.id,
      idUsuario: idUsuario ?? this.idUsuario,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
      dataUrL: dataUrL ?? this.dataUrL,
      aprobado: aprobado ?? this.aprobado,
      ranking: ranking ?? this.ranking,
      createdAt: createdAt ?? this.createdAt,
    );
  }


}