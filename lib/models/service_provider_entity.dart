class ServiceProviderEntity {
  final int? id;
  final String? name;
  final String? telephone;
  final String? address;
  final String? email;
  final String? url;
  final String? map;
  final String? telephoneTwo;
  final String? telephoneThree;
  final int? rating;
  final int? distance;
  final String? timeDistance;

  ServiceProviderEntity({
    required this.id,
    required this.name,
    required this.telephone,
    required this.address,
    required this.email,
    required this.url,
    required this.map,
    required this.telephoneTwo,
    required this.telephoneThree,
    required this.rating,
    required this.distance,
    required this.timeDistance,
  });

  factory ServiceProviderEntity.fromJson(Map<String, dynamic> json) {
    return ServiceProviderEntity(
      id: json['Id'],
      name: json['Name'],
      telephone: json['Telephone'],
      email: json['Email'],
      address: json['Address'],
      url: json['Url'],
      map: json['Map'],
      telephoneTwo: json['TelephoneTwo'],
      telephoneThree: json['TelephoneThird'],
      rating: json['Rating'],
      distance: json['Distance'],
      timeDistance: json['TimeDistance'],
    );
  }
}
