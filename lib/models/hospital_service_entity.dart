class HospitalServiceEntity {
  final int id;
  final String name;

  HospitalServiceEntity({
    required this.id,
    required this.name,
  });

  factory HospitalServiceEntity.fromJson(Map<String, dynamic> json) {
    return HospitalServiceEntity(
      id: json['ID'],
      name: json['Name'],
    );
  }
}
