class DoctorSpecialistEntity {
  final int? id;
  final String? name;
  final String? telephone;
  final String? address;
  final String? url;
  final String? map;
  final int? rating;
  final String? level;
  final String? specialist;

  DoctorSpecialistEntity({
    required this.id,
    required this.name,
    required this.telephone,
    required this.address,
    required this.url,
    required this.map,
    required this.rating,
    required this.level,
    required this.specialist,
  });

  factory DoctorSpecialistEntity.fromJson(Map<String, dynamic> json) {
    return DoctorSpecialistEntity(
      id: json['Id'],
      name: json['Name'],
      telephone: json['Telephone'],
      address: json['Address'],
      url: json['Url'],
      map: json['Map'],
      rating: json['Rating'],
      level: json['ServicePorviderLevelName'],
      specialist: json['ServicePorviderSpecialtiesName'],
    );
  }
}
