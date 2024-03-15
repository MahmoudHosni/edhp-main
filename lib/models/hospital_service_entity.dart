class HospitalServiceEntity {
  final int clinicId;
  final String name;

  HospitalServiceEntity({
    required this.clinicId,
    required this.name,
  });

  factory HospitalServiceEntity.fromJson(Map<String, dynamic> json) {
    return HospitalServiceEntity(
      clinicId: json['ServiceID'],
      name: json['Name'],
    );
  }
}
