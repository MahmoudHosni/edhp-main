import 'package:edhp/features/confirm_membership_data/cubit/ResultObject.dart';

class ConfirmResponse{
  int ID=0;
  int ResultType=0;
  String Message='';
  bool IsSuccess=false;
  bool IsFailed=false;
  ResultObject? result;

  ConfirmResponse({required this.ID,required this.ResultType,required this.IsFailed,required this.IsSuccess,required this.Message,this.result});

  ConfirmResponse.fromJson(Map<String, dynamic> json) {
    ID = json['ID'];
    ResultType = json['ResultType'];
    Message = json['Message'];
    IsSuccess = json['IsSuccess'];
    IsFailed = json['IsFailed'];
    result = ResultObject.fromJson(json['ResultObject']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = ID;
    data['ResultType'] = ResultType;
    data['Message'] = Message;
    data['IsSuccess'] = IsSuccess;
    data['IsFailed'] = IsFailed;
    data['ResultObject'] = result?.toJson();
    return data;
  }
}