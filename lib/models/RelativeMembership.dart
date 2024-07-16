

class RelativeMembership{
  int? subscriptionTypeID;
  int? relationTypeID;
  String? relationType;
  int? medicalCompanyID;
  String? medicalCompanyName;
  String? SubscriberProfileID;
  int? membershipTypeID;
  String? membershipTypeName;
  String? subscriptionStartDate;
  String? subscriptionEndDate;
  String? identityNumber;
  int? stateID;
  String? subscriberName;
  int? cityID;
  int? gender;
  String? birthDate;
  String? subscriptionNumber;
  int? totalPrice;
  bool? paid;

  RelativeMembership(
      {this.subscriptionTypeID,
        this.relationTypeID,
        this.relationType,
        this.medicalCompanyID,
        this.medicalCompanyName,
        this.membershipTypeID,
        this.membershipTypeName,
        this.subscriptionStartDate,
        this.subscriptionEndDate,
        this.identityNumber,
        this.stateID,
        this.subscriberName,
        this.cityID,
        this.gender,
        this.birthDate,
        this.subscriptionNumber,
        this.totalPrice,
        this.paid,this.SubscriberProfileID});

  RelativeMembership.fromJson(Map<String, dynamic> json) {
    subscriptionTypeID = json['SubscriptionTypeID'];
    relationTypeID = json['RelationTypeID'];
    relationType = json['RelationType'];
    medicalCompanyID = json['MedicalCompanyID'];
    medicalCompanyName = json['MedicalCompanyName'];
    membershipTypeID = json['MembershipTypeID'];
    membershipTypeName = json['MembershipTypeName'];
    subscriptionStartDate = json['SubscriptionStartDate'];
    subscriptionEndDate = json['SubscriptionEndDate'];
    identityNumber = json['IdentityNumber'];
    stateID = json['StateID'];
    subscriberName = json['SubscriberName'];
    cityID = json['CityID'];
    gender = json['Gender'];
    birthDate = json['BirthDate'];
    subscriptionNumber = json['SubscriptionNumber'];
    totalPrice = json['TotalPrice'];
    paid = json['Paid'];
    SubscriberProfileID = json['SubscriberProfileID'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SubscriptionTypeID'] = this.subscriptionTypeID;
    data['RelationTypeID'] = this.relationTypeID;
    data['RelationType'] = this.relationType;
    data['MedicalCompanyID'] = this.medicalCompanyID;
    data['MedicalCompanyName'] = this.medicalCompanyName;
    data['MembershipTypeID'] = this.membershipTypeID;
    data['MembershipTypeName'] = this.membershipTypeName;
    data['SubscriptionStartDate'] = this.subscriptionStartDate;
    data['SubscriptionEndDate'] = this.subscriptionEndDate;
    data['IdentityNumber'] = this.identityNumber;
    data['StateID'] = this.stateID;
    data['SubscriberName'] = this.subscriberName;
    data['CityID'] = this.cityID;
    data['Gender'] = this.gender;
    data['BirthDate'] = this.birthDate;
    data['SubscriptionNumber'] = this.subscriptionNumber;
    data['TotalPrice'] = this.totalPrice;
    data['Paid'] = this.paid;
    data['SubscriberProfileID'] = this.SubscriberProfileID;
    return data;
  }
}