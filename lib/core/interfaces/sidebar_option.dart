class SidebarOptions {
  final String id;
  final String title;
  final bool isVisible;
  final int order;

  SidebarOptions(
      {required this.id,
      required this.title,
      required this.isVisible,
      required this.order});

  factory SidebarOptions.fromMap(Map<String, dynamic> map) {
    return SidebarOptions(
      id: map['id'],
      title: map['nombre_opcion'],
      isVisible: map['estado'],
      order: map['orden'],
    );
  }
}
