class GovernorateEntity {
  final List<ListStatesEntity> listStates;

  GovernorateEntity({
    required this.listStates,
  });

  factory GovernorateEntity.fromJson(Map<String, dynamic> json) {
    var statesList = json['ListStates'] as List;
    List<ListStatesEntity> states =
        statesList.map((i) => ListStatesEntity.fromJson(i)).toList();

    return GovernorateEntity(
      listStates: states,
    );
  }
}

class ListStatesEntity {
  final int id;
  final String name;

  ListStatesEntity({
    required this.id,
    required this.name,
  });

  factory ListStatesEntity.fromJson(Map<String, dynamic> json) {
    return ListStatesEntity(
      id: json['ID'],
      name: json['Name'],
    );
  }
}
