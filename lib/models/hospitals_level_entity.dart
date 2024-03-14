class HospitalsLevelEntity {
  final int id;
  final String name;

  HospitalsLevelEntity({
    required this.id,
    required this.name,
  });

  factory HospitalsLevelEntity.fromJson(Map<String, dynamic> json) {
    return HospitalsLevelEntity(
      id: json['ID'],
      name: json['Name'],
    );
  }
}
