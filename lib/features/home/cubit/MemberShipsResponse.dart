

class MemberShipsResponse {
  int SubscriptionTypeID=0;
  int? OrganizationID=0;
  String? OrganizationName='';
  String? OrganizationMembershipNumber='';
  int MedicalCompanyID=0;
  String MedicalCompanyName='';
  int MembershipTypeID=0;
  String MembershipTypeName='';
  String SubscriptionStartDate='';
  String SubscriptionEndDate='';
  int StateID=0;
  int CityID=0;
  int Gender=0;
  String BirthDate='';
  String SubscriptionNumber='';
  String Name='';
  String SubscriberProfileID="";

  int TotalPrice=0;

  MemberShipsResponse({required this.MedicalCompanyID,required this.MembershipTypeID,required this.OrganizationMembershipNumber,
  required this.OrganizationID,required this.MembershipTypeName,required this.OrganizationName,required this.SubscriptionStartDate,required this.SubscriptionEndDate
  ,required this.Gender,required this.SubscriptionTypeID,required this.BirthDate,required this.StateID,required this.CityID,required this.MedicalCompanyName,required this.SubscriptionNumber,required this.TotalPrice,required this.Name,required this.SubscriberProfileID});


  MemberShipsResponse.fromJson(Map<String, dynamic> json) {
    TotalPrice = json['TotalPrice'];
    SubscriptionNumber = json['SubscriptionNumber'];
    MedicalCompanyName = json['MedicalCompanyName'];
    CityID = json['CityID'];
    MembershipTypeID = json['MembershipTypeID'];

    StateID = json['StateID'];
    BirthDate = json['BirthDate'];
    SubscriptionTypeID = json['SubscriptionTypeID'];
    Gender = json['Gender'];
    SubscriptionEndDate = json['SubscriptionEndDate'];
    SubscriptionStartDate = json['SubscriptionStartDate'];

    OrganizationName = json['OrganizationName'];
    MembershipTypeName = json['MembershipTypeName'];

    OrganizationID = json['OrganizationID'];
    OrganizationMembershipNumber = json['OrganizationMembershipNumber'];
    MedicalCompanyID = json['MedicalCompanyID'];
  }
}