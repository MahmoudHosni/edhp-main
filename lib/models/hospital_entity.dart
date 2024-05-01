class HospitalEntity {
  final int? id;
  final String? name;
  final String? telephone;
  final String? address;
  final String? url;
  final String? map;
  final int? rating;
  final String? level;

  HospitalEntity({
    required this.id,
    required this.name,
    required this.telephone,
    required this.address,
    required this.url,
    required this.map,
    required this.rating,
    required this.level,
  });

  factory HospitalEntity.fromJson(Map<String, dynamic> json) {
    return HospitalEntity(
      id: json['Id'],
      name: json['Name'],
      telephone: json['Telephone'],
      address: json['Address'],
      url: json['Url'],
      map: json['Map'],
      rating: json['Rating'],
      level: json['ServicePorviderLevelName'],
    );
  }
}
