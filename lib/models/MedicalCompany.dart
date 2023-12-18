
class MedicalCompany {
  int? iD;
  String? name;

  MedicalCompany({this.iD, this.name});

  MedicalCompany.fromJson(Map<String, dynamic> json) {
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