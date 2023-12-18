
class ForgetResponse {
  int? iD;
  int? resultType;
  String? message;
  bool? isSuccess;
  bool? isFailed;

  ForgetResponse({this.iD,
    this.resultType,
    this.message,
    this.isSuccess,
    this.isFailed});

  ForgetResponse.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    resultType = json['ResultType'];
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    isFailed = json['IsFailed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['ResultType'] = resultType;
    data['Message'] = message;
    data['IsSuccess'] = isSuccess;
    data['IsFailed'] = isFailed;
    return data;
  }
}