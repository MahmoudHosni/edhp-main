

class ConditionsAndDetails {
  int? resultType;
  String? message;
  ConditionsAndDetailsResult? resultObject;
  bool? isSuccess;
  bool? isFailed;

  ConditionsAndDetails(
      {this.resultType,
        this.message,
        this.resultObject,
        this.isSuccess,
        this.isFailed});

  ConditionsAndDetails.fromJson(Map<String, dynamic> json) {
    resultType = json['ResultType'];
    message = json['Message'];
    resultObject = json['ResultObject'] != null
        ? new ConditionsAndDetailsResult.fromJson(json['ResultObject'])
        : null;
    isSuccess = json['IsSuccess'];
    isFailed = json['IsFailed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ResultType'] = this.resultType;
    data['Message'] = this.message;
    if (this.resultObject != null) {
      data['ResultObject'] = this.resultObject!.toJson();
    }
    data['IsSuccess'] = this.isSuccess;
    data['IsFailed'] = this.isFailed;
    return data;
  }
}

class ConditionsAndDetailsResult {
  String? eventDate;
  String? eventDateFormatted;
  String? eventPlace;
  String? eventTerms;
  int? attendanceLimit;
  int? attendanceNumber;
  String? name;
  String? description;
  String? creationTime;
  int? createdBy;
  String? modificationTime;
  int? modifiedBy;
  bool? isDeleted;
  int? saasProfileId;
  int? iD;
  bool? isActive;

  ConditionsAndDetailsResult(
      {this.eventDate,
        this.eventDateFormatted,
        this.eventPlace,
        this.eventTerms,
        this.attendanceLimit,
        this.attendanceNumber,
        this.name,
        this.description,
        this.creationTime,
        this.createdBy,
        this.modificationTime,
        this.modifiedBy,
        this.isDeleted,
        this.saasProfileId,
        this.iD,
        this.isActive});

  ConditionsAndDetailsResult.fromJson(Map<String, dynamic> json) {
    eventDate = json['EventDate'];
    eventDateFormatted = json['EventDateFormatted'];
    eventPlace = json['EventPlace'];
    eventTerms = json['EventTerms'];
    attendanceLimit = json['AttendanceLimit'];
    attendanceNumber = json['AttendanceNumber'];
    name = json['Name'];
    description = json['Description'];
    creationTime = json['CreationTime'];
    createdBy = json['CreatedBy'];
    modificationTime = json['ModificationTime'];
    modifiedBy = json['ModifiedBy'];
    isDeleted = json['IsDeleted'];
    saasProfileId = json['SaasProfileId'];
    iD = json['ID'];
    isActive = json['IsActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EventDate'] = this.eventDate;
    data['EventDateFormatted'] = this.eventDateFormatted;
    data['EventPlace'] = this.eventPlace;
    data['EventTerms'] = this.eventTerms;
    data['AttendanceLimit'] = this.attendanceLimit;
    data['AttendanceNumber'] = this.attendanceNumber;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['CreationTime'] = this.creationTime;
    data['CreatedBy'] = this.createdBy;
    data['ModificationTime'] = this.modificationTime;
    data['ModifiedBy'] = this.modifiedBy;
    data['IsDeleted'] = this.isDeleted;
    data['SaasProfileId'] = this.saasProfileId;
    data['ID'] = this.iD;
    data['IsActive'] = this.isActive;
    return data;
  }
}
