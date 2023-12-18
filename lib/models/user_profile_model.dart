class GetUserProfile {
  int? profileID;
  String? profileName;
  String? userName;
  String? identityNumber;
  String? email;
  String? mobileNumber;
  int? gender;

  GetUserProfile(
      {this.profileID,
        this.profileName,
        this.userName,
        this.identityNumber,
        this.email,
        this.mobileNumber,
        this.gender});

  GetUserProfile.fromJson(Map<String, dynamic> json) {
    profileID = json['ProfileID'];
    profileName = json['ProfileName'];
    userName = json['UserName'];
    identityNumber = json['IdentityNumber'];
    email = json['Email'];
    mobileNumber = json['MobileNumber'];
    gender = json['Gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProfileID'] = profileID;
    data['ProfileName'] = profileName;
    data['UserName'] = userName;
    data['IdentityNumber'] = identityNumber;
    data['Email'] = email;
    data['MobileNumber'] = mobileNumber;
    data['Gender'] = gender;
    return data;
  }
}