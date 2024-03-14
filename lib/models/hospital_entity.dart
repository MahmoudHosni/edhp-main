class HospitalEntity {
  final int? id;
  final String? name;
  final String? telephone;
  final String? address;
  final String? url;
  final String? map;
  final String? photoPath;
  final int? rating;

  HospitalEntity({
    required this.id,
    required this.name,
    required this.telephone,
    required this.address,
    required this.url,
    required this.map,
    required this.photoPath,
    required this.rating,
  });

  factory HospitalEntity.fromJson(Map<String, dynamic> json) {
    return HospitalEntity(
      id: json['Id'],
      name: json['Name'],
      telephone: json['Telephone'],
      address: json['Address'],
      url: json['Url'],
      map: json['Map'],
      photoPath: json['PhotoPath'],
      rating: json['Rating'],
    );
  }
}
