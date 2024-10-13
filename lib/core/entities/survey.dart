class Survey {
  final String id;
  final String name;

  Survey({
    required this.id,
    required this.name,
  });

  factory Survey.fromMap(Map<String, dynamic> map) {
    return Survey(
      id: map['id'],
      name: map['titulo'],
    );
  }
}
