

class NewsModel {
  final String? id;
  final String titulo;
  final String descripcion;
  final String urlImagen;
  final String imagenHint;
  final DateTime createdAt;

  NewsModel({
    this.id,
    required this.titulo,
    required this.descripcion,
    required this.urlImagen,
    required this.imagenHint,
    required this.createdAt
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'] ?? 0,
      titulo: json['titulo'],
      descripcion: json['descripcion'],
      urlImagen: json['url_imagen_portada'] ?? '',
      imagenHint: json['imagen_hint'] ?? '',
      createdAt: DateTime.parse(json['created_at'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'titulo': titulo,
      'descripcion': descripcion,
      'url_imagen_portada': urlImagen,
      'imagen_hint': imagenHint,
      'created_at': createdAt.toIso8601String()
    };
  }

  NewsModel copyWith({
    String? id,
    String? titulo,
    String? descripcion,
    String? urlImagen,
    String? imagenHint,
    DateTime? createdAt
  }) {
    return NewsModel(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      urlImagen: urlImagen ?? this.urlImagen,
      imagenHint: imagenHint ?? this.imagenHint,
      createdAt: createdAt ?? this.createdAt
    );
  }

}