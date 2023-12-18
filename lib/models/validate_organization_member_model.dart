class ValidateOrganizationMemberModel {
  int? iD;
  int? resultType;
  String? message;
  ResultObject? resultObject;
  bool? isSuccess;
  bool? isFailed;

  ValidateOrganizationMemberModel(
      {this.iD,
        this.resultType,
        this.message,
        this.resultObject,
        this.isSuccess,
        this.isFailed});

  ValidateOrganizationMemberModel.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    resultType = json['ResultType'];
    message = json['Message'];
    resultObject = json['ResultObject'] != null
        ? new ResultObject.fromJson(json['ResultObject'])
        : null;
    isSuccess = json['IsSuccess'];
    isFailed = json['IsFailed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
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

class ResultObject {
  int? profileID;
  int? subscriptionTypeID;
  int? organizationID;
  int? membershipTypeID;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  int? discountPercentage;
  int? organizationMembershipNumber;
  String? profileName;
  int? gender;
  String? identityNumber;
  String? mobileNumber;
  String? email;

  ResultObject(
      {this.profileID,
        this.subscriptionTypeID,
        this.organizationID,
        this.membershipTypeID,
        this.subscriptionStartDate,
        this.subscriptionEndDate,
        this.discountPercentage,
        this.organizationMembershipNumber,
        this.profileName,
        this.gender,
        this.identityNumber,
        this.mobileNumber,
        this.email});

  ResultObject.fromJson(Map<String, dynamic> json) {
    profileID = json['ProfileID'];
    subscriptionTypeID = json['SubscriptionTypeID'];
    organizationID = json['OrganizationID'];
    membershipTypeID = json['MembershipTypeID'];
    subscriptionStartDate = json['SubscriptionStartDate'];
    subscriptionEndDate = json['SubscriptionEndDate'];
    discountPercentage = json['DiscountPercentage'];
    organizationMembershipNumber = json['OrganizationMembershipNumber'];
    profileName = json['ProfileName'];
    gender = json['Gender'];
    identityNumber = json['IdentityNumber'];
    mobileNumber = json['MobileNumber'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProfileID'] = this.profileID;
    data['SubscriptionTypeID'] = this.subscriptionTypeID;
    data['OrganizationID'] = this.organizationID;
    data['MembershipTypeID'] = this.membershipTypeID;
    data['SubscriptionStartDate'] = this.subscriptionStartDate;
    data['SubscriptionEndDate'] = this.subscriptionEndDate;
    data['DiscountPercentage'] = this.discountPercentage;
    data['OrganizationMembershipNumber'] = this.organizationMembershipNumber;
    data['ProfileName'] = this.profileName;
    data['Gender'] = this.gender;
    data['IdentityNumber'] = this.identityNumber;
    data['MobileNumber'] = this.mobileNumber;
    data['Email'] = this.email;
    return data;
  }
}