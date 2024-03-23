
class MedicalEvent {
  int? iD;
  String? name;
  bool? registered;

  MedicalEvent.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    registered = json['Registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Name'] = name;
    data['Registered']=registered;
    return data;
  }
}