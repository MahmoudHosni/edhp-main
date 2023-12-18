class GetOrganizationItem {
  int? iD;
  String? name;

  GetOrganizationItem({this.iD, this.name});

  GetOrganizationItem.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Name'] = name;
    return data;
  }
}