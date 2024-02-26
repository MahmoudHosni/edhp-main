class MedicalCenterBranchEntity {
  final int? id;
  final String? title;
  final String? address;
  final String? phone;

  MedicalCenterBranchEntity({
    required this.id,
    required this.title,
    required this.address,
    required this.phone,
  });

  factory MedicalCenterBranchEntity.fromJson(Map<String, dynamic> json) {
    return MedicalCenterBranchEntity(
      id: json['ID'],
      title: json['Name'],
      address: json['Address'],
      phone: json['Telephone'],
    );
  }
}
