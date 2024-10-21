
class ProposedApproachModel {
  final String titulo;
  final String descripcion;

  ProposedApproachModel({
    required this.titulo,
    required this.descripcion,
  });

  factory ProposedApproachModel.fromJson(Map<String, dynamic> json) {
    return ProposedApproachModel(
      titulo: json['titulo'],
      descripcion: json['descripcion'] ?? '',
    );
  }

  factory ProposedApproachModel.fromJsonOnProposal(Map<String, dynamic> json) {
    return ProposedApproachModel(
      titulo: json['titulo'],
      descripcion: '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descripcion': descripcion,
    };
  }

  ProposedApproachModel copyWith({
    String? titulo,
    String? descripcion,
  }) {
    return ProposedApproachModel(
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
    );
  }

}