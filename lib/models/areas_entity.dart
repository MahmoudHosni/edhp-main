class AreasEntity {
  final int id;
  final String name;

  AreasEntity({
    required this.id,
    required this.name,
  });

  factory AreasEntity.fromJson(Map<String, dynamic> json) {
    return AreasEntity(
      id: json['ID'],
      name: json['Name'],
    );
  }
}
