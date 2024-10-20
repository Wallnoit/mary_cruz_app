

class FacultyModel {
  final int id;
  final String nombre;
  final String siglas;
  final bool estado;

  FacultyModel({
    required this.id,
    required this.nombre,
    required this.siglas,
    required this.estado,
  });

  factory FacultyModel.fromJson(Map<String, dynamic> json) {
    return FacultyModel(
      id: json['id'],
      nombre: json['nombre'],
      siglas: json['siglas'],
      estado: json['estado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'siglas': siglas,
      'estado': estado,
    };
  }

  FacultyModel copyWith({
    int? id,
    String? nombre,
    String? siglas,
    bool? estado,
  }) {
    return FacultyModel(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      siglas: siglas ?? this.siglas,
      estado: estado ?? this.estado,
    );
  }

}