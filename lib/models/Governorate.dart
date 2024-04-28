

class Governorate{
  int? ID;
  String? name;

  Governorate({required this.ID,required this.name});

  Governorate.fromJson(Map<String, dynamic> json) {
    ID = json['ID']  ;
    name = json['Name']  ;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = ID;
    data['Name'] = name;
    return data;
  }
}