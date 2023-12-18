class LoginModel {
  int? iD;
  int? resultType;
  String? message;
  ResultObject? resultObject;
  bool? isSuccess;
  bool? isFailed;

  LoginModel(
      {this.iD,
        this.resultType,
        this.message,
        this.resultObject,
        this.isSuccess,
        this.isFailed});

  LoginModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    resultType = json['ResultType'];
    message = json['Message'];
    resultObject = json['ResultObject'] != null
        ? ResultObject.fromJson(json['ResultObject'])
        : null;
    isSuccess = json['IsSuccess'];
    isFailed = json['IsFailed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['ResultType'] = resultType;
    data['Message'] = message;
    if (resultObject != null) {
      data['ResultObject'] = resultObject!.toJson();
    }
    data['IsSuccess'] = isSuccess;
    data['IsFailed'] = isFailed;
    return data;
  }
}

class ResultObject {
  String? userName;
  int? profileID;
  String? profileName;
  String? accessToken;

  ResultObject(
      {this.userName, this.profileID, this.profileName, this.accessToken});

  ResultObject.fromJson(Map<String, dynamic> json) {
    userName = json['UserName'];
    profileID = json['ProfileID'];
    profileName = json['ProfileName'];
    accessToken = json['AccessToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserName'] = userName;
    data['ProfileID'] = profileID;
    data['ProfileName'] = profileName;
    data['AccessToken'] = accessToken;
    return data;
  }
}