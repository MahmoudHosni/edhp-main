
class MedicalAdvice {
  int? iD;
  String? name;

  MedicalAdvice({this.iD, this.name});

  MedicalAdvice.fromJson(Map<String, dynamic> json) {
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