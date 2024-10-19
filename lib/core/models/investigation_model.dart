class InvestigationModel {
  String id;
  String title;
  String description;
  String publicationDate;
  String? url;

  InvestigationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.publicationDate,
    this.url,
  });

  factory InvestigationModel.fromJson(Map<String, dynamic> json) {
    return InvestigationModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      publicationDate: json['publication_date'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'publicationDate': publicationDate,
      'url': url,
    };
  }
}
