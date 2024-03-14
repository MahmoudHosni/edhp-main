class LookupEntity {
  final int id;
  final String name;

  LookupEntity({
    required this.id,
    required this.name,
  });

  factory LookupEntity.fromJson(Map<String, dynamic> json) {
    return LookupEntity(
      id: json['ID'],
      name: json['Name'],
    );
  }
}
