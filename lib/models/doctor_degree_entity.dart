class DoctorDegreesEntity {
  final int id;
  final String name;

  DoctorDegreesEntity({
    required this.id,
    required this.name,
  });

  factory DoctorDegreesEntity.fromJson(Map<String, dynamic> json) {
    return DoctorDegreesEntity(
      id: json['ID'],
      name: json['Name'],
    );
  }
}
