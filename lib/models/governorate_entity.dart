class GovernorateEntity {
  final int id;
  final String name;

  GovernorateEntity({
    required this.id,
    required this.name,
  });

  factory GovernorateEntity.fromJson(Map<String, dynamic> json) {
    return GovernorateEntity(
      id: json['ID'],
      name: json['Name'],
    );
  }
}
