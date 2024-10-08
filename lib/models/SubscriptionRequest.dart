import 'dart:io';

class SubscriptionRequest {
  int? MedicalCompanyID;
  int? MembershipTypeID;
  int? SubscriptionTypeID;
  int? OrganizationID;
  String? Cost;
  String? IdentityNumber;
  String? OrganizationMembershipNumber;
  int? CityID;
  int? StateID;
  String? Address;
  int? Gender;
  String? BirthDate;
  String? SubscriptionStartDate;
  String? SubscriptionEndDate;
  File? PersonalImage;
  File? NationalNumberImage;
  File? OrganizationMembershipNumberImage;

  String? MembershipTypeName;
  String? MedicalCompanyName;
  String? OrganizationName;

  String? ArabicName;
  String? EnglishName;
  String? MobileNumber;
  int? RelationTypeID;
  String SubscriptionNumber='';
  bool isRelativeRequest = false;

  SubscriptionRequest();
}