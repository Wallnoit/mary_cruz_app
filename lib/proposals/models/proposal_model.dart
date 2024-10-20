

import 'package:mary_cruz_app/news/models/proposed_approach_model.dart';

class ProposalModel {
  String id;
  String titulo;
  String descripcion;
  String imageUrl;
  List<ProposedApproachModel> enfoques;


  ProposalModel({
    required this.id,
    required this.titulo,
    required this.descripcion,
    required this.imageUrl,
    required this.enfoques
  });

}