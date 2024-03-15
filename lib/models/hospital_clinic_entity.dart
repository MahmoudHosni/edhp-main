class HospitalClinicEntity {
  final int clinicId;
  final String name;

  HospitalClinicEntity({
    required this.clinicId,
    required this.name,
  });

  factory HospitalClinicEntity.fromJson(Map<String, dynamic> json) {
    return HospitalClinicEntity(
      clinicId: json['ClinicsID'],
      name: json['Name'],
    );
  }
}
