

import 'package:mary_cruz_app/core/models/faculties_model.dart';
import 'package:mary_cruz_app/news/models/proposed_approach_model.dart';

class ProposalModel {
  String id;
  String titulo;
  String descripcion;
  String imageUrl;
  List<ProposedApproachModel> enfoques;
  List<FacultyModel> facultades;


  ProposalModel({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.imageUrl,
    required this.enfoques,
    required this.facultades,
  });

  factory ProposalModel.fromJson(Map<String, dynamic> json) {
    try {
      List<ProposedApproachModel> enfoques = [];
      List<FacultyModel> facultades = [];

      try {
        if (json['enfoques_propuestas'] != null) {
          json['enfoques_propuestas'].forEach((v) {
            enfoques.add(ProposedApproachModel.fromJsonOnProposal(v));
          });
        }
      } catch (e) {
        print('Error al parsear enfoques: $e');
      }

      try {
        if (json['facultades_afectadas'] != null) {
          json['facultades_afectadas'].forEach((v) {
            facultades.add(FacultyModel.fromJsonOnProposal(v));
          });
        }
      } catch (e) {
        print('Error al parsear facultades: $e');
      }

      return ProposalModel(
        id: json['propuesta_id'],
        titulo: json['titulo'],
        descripcion: json['descripcion'],
        imageUrl: json['img_url'],
        enfoques: enfoques,
        facultades: facultades,
      );
    } catch (e, stackTrace) {
      print('Error al convertir JSON en ProposalModel: $e');
      print('Stacktrace: $stackTrace');
      throw Exception('Error al convertir JSON en ProposalModel');
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    data['titulo'] = this.titulo;
    data['descripcion'] = this.descripcion;
    data['imageUrl'] = this.imageUrl;
    data['enfoques'] = this.enfoques.map((v) => v.toJson()).toList();
    data['facultades'] = this.facultades.map((v) => v.toJson()).toList();
    return data;
  }

  ProposalModel copyWith({
    String? id,
    String? titulo,
    String? descripcion,
    String? imageUrl,
    List<ProposedApproachModel>? enfoques,
    List<FacultyModel>? facultades,
  }) {
    return ProposalModel(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      imageUrl: imageUrl ?? this.imageUrl,
      enfoques: enfoques ?? this.enfoques,
      facultades: facultades ?? this.facultades,
    );
  }

}