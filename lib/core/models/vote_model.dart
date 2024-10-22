
class VoteNewsModel{
  final int? id;
  final String idUsuario;
  final String idNoticia;
  final int puntuacion;
  final DateTime createdAt;

  VoteNewsModel({
    this.id,
    required this.idUsuario,
    required this.idNoticia,
    required this.puntuacion,
    required this.createdAt
  });

  factory VoteNewsModel.fromJson(Map<String, dynamic> json){
    return VoteNewsModel(
      id: json['id'],
      idUsuario: json['id_usuario'],
      idNoticia: json['id_noticia'],
      puntuacion: json['puntuacion'],
      createdAt: DateTime.parse(json['created_at'])
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id_usuario': idUsuario,
      'id_noticia': idNoticia,
      'puntuacion': puntuacion,
      'created_at': createdAt.toIso8601String()
    };
  }

  VoteNewsModel copyWith({
    int? id,
    String? idUsuario,
    String? idNoticia,
    int? puntuacion,
    DateTime? createdAt
  }){
    return VoteNewsModel(
      id: id ?? this.id,
      idUsuario: idUsuario ?? this.idUsuario,
      idNoticia: idNoticia ?? this.idNoticia,
      puntuacion: puntuacion ?? this.puntuacion,
      createdAt: createdAt ?? this.createdAt
    );
  }


}


class VoteProposalModel{
  final int? id;
  final String idUsuario;
  final String idPropuesta;
  final int puntuacion;
  final DateTime createdAt;

  VoteProposalModel({
    this.id,
    required this.idUsuario,
    required this.idPropuesta,
    required this.puntuacion,
    required this.createdAt
  });

  factory VoteProposalModel.fromJson(Map<String, dynamic> json){
    return VoteProposalModel(
      id: json['id'],
      idUsuario: json['id_usuario'],
      idPropuesta: json['id_propuesta'],
      puntuacion: json['puntuacion'],
      createdAt: DateTime.parse(json['created_at'])
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id_usuario': idUsuario,
      'id_propuesta': idPropuesta,
      'puntuacion': puntuacion,
      'created_at': createdAt.toIso8601String()
    };
  }

  VoteProposalModel copyWith({
    int? id,
    String? idUsuario,
    String? idPropuesta,
    int? puntuacion,
    DateTime? createdAt
  }){
    return VoteProposalModel(
      id: id ?? this.id,
      idUsuario: idUsuario ?? this.idUsuario,
      idPropuesta: idPropuesta ?? this.idPropuesta,
      puntuacion: puntuacion ?? this.puntuacion,
      createdAt: createdAt ?? this.createdAt
    );
  }

}