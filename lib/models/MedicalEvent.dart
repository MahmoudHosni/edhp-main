
class MedicalEvent {
  int? iD;
  String? name;
  bool? registered;
  String? EventDate;
  bool? IsActive;
  /*
  "EventDate": "2022-12-30T00:00:00",
        "IsActive": true
   */

  MedicalEvent.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    registered = json['Registered'];
    EventDate = json['EventDate'];
    IsActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Name'] = name;
    data['Registered']=registered;
    data['EventDate'] = EventDate;
    data['IsActive']=IsActive;
    return data;
  }
}