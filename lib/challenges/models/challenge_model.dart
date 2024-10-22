

class ChallengeModel {
  final int id;
  final String nombre;
  final String description;
  final DateTime createdAt;

  ChallengeModel({
    required this.id,
    required this.nombre,
    required this.description,
    required this.createdAt,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'],
      nombre: json['nombre'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'description': description,
      'created_at': createdAt.toIso8601String(),
    };
  }

  ChallengeModel copyWith({
    int? id,
    String? nombre,
    String? description,
    DateTime? createdAt,
  }) {
    return ChallengeModel(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
    );
  }

}


class ChallengeUserModel{
  final int id;
  final String idDispositivo;
  final int idReto;
  final String nombre;
  final String telefono;
  final DateTime createdAt;

  ChallengeUserModel({
    required this.id,
    required this.idDispositivo,
    required this.idReto,
    required this.nombre,
    required this.telefono,
    required this.createdAt,
  });

  factory ChallengeUserModel.fromJson(Map<String, dynamic> json) {
    return ChallengeUserModel(
      id: json['id'],
      idDispositivo: json['id_dispositivo'],
      idReto: json['id_reto'],
      nombre: json['nombre'],
      telefono: json['telefono'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_dispositivo': idDispositivo,
      'id_reto': idReto,
      'nombre': nombre,
      'telefono': telefono,
      'created_at': createdAt.toIso8601String(),
    };
  }

  ChallengeUserModel copyWith({
    int? id,
    String? idDispositivo,
    int? idReto,
    String? nombre,
    String? telefono,
    DateTime? createdAt,
  }) {
    return ChallengeUserModel(
      id: id ?? this.id,
      idDispositivo: idDispositivo ?? this.idDispositivo,
      idReto: idReto ?? this.idReto,
      nombre: nombre ?? this.nombre,
      telefono: telefono ?? this.telefono,
      createdAt: createdAt ?? this.createdAt,
    );
  }


}