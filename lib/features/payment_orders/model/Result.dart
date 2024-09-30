

class Result {
  int? resultType;
  String? message;
  bool? isSuccess;
  bool? isFailed;

  Result({this.resultType, this.message, this.isSuccess, this.isFailed});

  Result.fromJson(Map<String, dynamic> json) {
    resultType = json['ResultType'];
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    isFailed = json['IsFailed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResultType'] = this.resultType;
    data['Message'] = this.message;
    data['IsSuccess'] = this.isSuccess;
    data['IsFailed'] = this.isFailed;
    return data;
  }
}