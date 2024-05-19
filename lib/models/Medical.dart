
class MedicalAdvice {
  int? iD;
  String? name;
  String? description;

  MedicalAdvice({this.iD, this.name,this.description});

  MedicalAdvice.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Name'] = name;
    data['Description'] = description;
    return data;
  }
}