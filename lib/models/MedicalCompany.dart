
class MedicalCompany {
  int? iD;
  String? name;
  bool? followerTakesSameMembershipType;

  MedicalCompany({this.iD, this.name,this.followerTakesSameMembershipType});

  MedicalCompany.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    followerTakesSameMembershipType = json['FollowerTakesSameMembershipType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['Name'] = name;
    data['FollowerTakesSameMembershipType']= followerTakesSameMembershipType;
    return data;
  }
}