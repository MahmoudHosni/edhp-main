import 'package:edhp/features/confirm_membership_data/cubit/PaymentDetails.dart';

class ResultObject{
  int SubscriptionTypeID = 0;
  int OrganizationID = 0;
  String OrganizationMembershipNumber = '';
  int MedicalCompanyID = 0;
  int MembershipTypeID = 0;
  String SubscriptionStartDate = '';
  String SubscriptionEndDate = '';
  String SubscriptionNumber = '';
  int StateID = 0;
  int CityID = 0;
  int Gender = 1;
  int TotalPrice = 0;
  String BirthDate = '';
  String MembershipTypeName='';
  String OrganizationName='';
  String MedicalCompanyName='';
  bool Paid = false;
  PaymentDetails? paymentDetails;

  ResultObject({required this.SubscriptionTypeID,required this.OrganizationID,
                required this.OrganizationMembershipNumber,required this.MedicalCompanyID,required this.MembershipTypeID,
                required this.SubscriptionStartDate,required this.SubscriptionEndDate,required this.SubscriptionNumber,required this.StateID,
                required this.CityID,required this.Gender,required this.BirthDate,required this.Paid,required this.paymentDetails});

  ResultObject.fromJson(Map<String, dynamic> json) {
    SubscriptionTypeID = json['SubscriptionTypeID'];
    OrganizationID = json['OrganizationID'];
    OrganizationMembershipNumber = json['OrganizationMembershipNumber'];
    MedicalCompanyID = json['MedicalCompanyID'];
    MembershipTypeID = json['MembershipTypeID'];

    SubscriptionStartDate = json['SubscriptionStartDate'];
    SubscriptionEndDate = json['SubscriptionEndDate'];
    SubscriptionNumber = json['SubscriptionNumber'];

    MembershipTypeName = json['MembershipTypeName'];
    OrganizationName = json['OrganizationName'];
    MedicalCompanyName = json['MedicalCompanyName'];

    StateID = json['StateID'];
    CityID = json['CityID'];
    TotalPrice = json['TotalPrice'];

    Gender = json['Gender'];
    BirthDate = json['BirthDate'];

    Paid = json['Paid'];
    paymentDetails =json['PaymentDetails'] == null? null: PaymentDetails.fromJson(json['PaymentDetails']);
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

    data['SubscriptionNumber'] = SubscriptionNumber;
    data['StateID'] = StateID;
    data['TotalPrice'] = TotalPrice;
    data['CityID'] = CityID;
    data['Gender'] = Gender;
    data['BirthDate'] = BirthDate;

    data['Paid'] = Paid;
    data['PaymentDetails'] = paymentDetails;
    return data;
  }
}