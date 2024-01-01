
class ResultObject{
  int SubscriptionTypeID = 0;
  int OrganizationID = 0;
  int OrganizationMembershipNumber = 0;
  int MedicalCompanyID = 0;
  int MembershipTypeID = 0;
  String SubscriptionStartDate = '';
  String SubscriptionEndDate = '';
  String IdentityNumber = '';
  int StateID = 0;
  int CityID = 0;
  int Gender = 1;
  String BirthDate = '';

  ResultObject({required this.SubscriptionTypeID,required this.OrganizationID,
                required this.OrganizationMembershipNumber,required this.MedicalCompanyID,required this.MembershipTypeID,
                required this.SubscriptionStartDate,required this.SubscriptionEndDate,required this.IdentityNumber,required this.StateID,
                required this.CityID,required this.Gender,required this.BirthDate,});

  ResultObject.fromJson(Map<String, dynamic> json) {
    SubscriptionTypeID = json['SubscriptionTypeID'];
    OrganizationID = json['OrganizationID'];
    OrganizationMembershipNumber = json['OrganizationMembershipNumber'];
    MedicalCompanyID = json['MedicalCompanyID'];
    MembershipTypeID = json['MembershipTypeID'];

    SubscriptionStartDate = json['SubscriptionStartDate'];
    SubscriptionEndDate = json['SubscriptionEndDate'];
    IdentityNumber = json['IdentityNumber'];
    StateID = json['StateID'];
    CityID = json['CityID'];

    Gender = json['Gender'];
    BirthDate = json['BirthDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SubscriptionTypeID'] = SubscriptionTypeID;
    data['OrganizationID'] = OrganizationID;
    data['OrganizationMembershipNumber'] = OrganizationMembershipNumber;
    data['MedicalCompanyID'] = MedicalCompanyID;
    data['MembershipTypeID'] = MembershipTypeID;

    data['SubscriptionStartDate'] = SubscriptionStartDate;
    data['SubscriptionEndDate'] = SubscriptionEndDate;

    data['IdentityNumber'] = IdentityNumber;
    data['StateID'] = StateID;

    data['CityID'] = CityID;
    data['Gender'] = Gender;
    data['BirthDate'] = BirthDate;
    return data;
  }
}