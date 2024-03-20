class HospitalClinicEntity {
  final int id;
  final String name;

  HospitalClinicEntity({
    required this.id,
    required this.name,
  });

  factory HospitalClinicEntity.fromJson(Map<String, dynamic> json) {
    return HospitalClinicEntity(
      id: json['ID'],
      name: json['Name'],
    );
  }
}
