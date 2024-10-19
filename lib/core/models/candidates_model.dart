import 'package:mary_cruz_app/core/models/investigation_model.dart';

class CandidatesModel {
  final String id;
  final String name;
  final String phrase;
  final String role;
  final String image;
  final String urlVideo;
  final String? facebook;
  final String? instagram;
  final String? tiktok;
  final List<String> academicFormation;
  final List<String> workExperience;
  final List<InvestigationModel> investigations;

  CandidatesModel({
    required this.id,
    required this.name,
    required this.phrase,
    required this.image,
    required this.urlVideo,
    this.facebook,
    this.instagram,
    this.tiktok,
    required this.role,
    required this.academicFormation,
    required this.workExperience,
    required this.investigations,
  });

  factory CandidatesModel.fromJson(Map<String, dynamic> json) {
    return CandidatesModel(
      id: json['id'],
      name: json['name'],
      phrase: json['phrase'],
      image: json['image'],
      facebook: json['facebook'],
      instagram: json['instagram'],
      tiktok: json['tiktok'],
      role: json['role'],
      academicFormation: List<String>.from(json['academicFormation']),
      workExperience: List<String>.from(json['workExperience']),
      investigations: List<InvestigationModel>.from(
        json['investigations'].map(
          (x) => InvestigationModel.fromJson(x),
        ),
      ), urlVideo: json['urlVideo'],
    );
  }
}
