import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
const String baseUrl = 'https://edhp-eg.com';

class EndPoint {
  static const String login = '/apiAccount/Login';
  static const String register = '/apiAccount/Register';
  static const String getProfile = '/apiUserInterface/GetProfile';
  static const String updateProfile = '/apiUserInterface/UpdateProfile';
  static const String getOrganizations = '/apiPublicUserInterface/GetOrganizations';
  static const String getMedicalCompanies = '/apiUserInterface/GetMICs';
  static const String updateProfileImage = '/apiAttachments/UpdateProfileImage';
  static const String validateOrganizationMember = '/apiAccount/ValidateOrganizationMember';
  static const String getSubscriptionInfoLookUps = '/apiUserInterface/GetSubscriptionInfoLookupsViewModel';
  static const String updatePassword = '/apiUserInterface/UpdatePassword';
  static String getProfileImage(BuildContext context){
    return '$baseUrl/apiAttachments/Get?referenceTypeId=${1}&referenceId=${GetProfileCubit.get(context).userProfileModel!.profileID}';
  }
  static const imageProfile = '/apiAttachments/Get';
  static const String organizationMemberSubscription = '/apiAccount/OrganizationMemberSubscription';
  static const String getNewAccessToken = '/apiAccount/GetNewToken';
  static const String getMembershipTypes = '/apiMembershipTypes/GetList';// '/apiUserInterface/GetMembershipTypes';https://edhp-eg.com/apiMembershipTypes/GetList
  static const String getSubscriptionInfoLookup = '/apiPublicUserInterface/GetSubscriptionInfoLookupsViewModel';
  static const String getStaticData = '/apiPublicUserInterface/GetSubscriptionInfoLookupsViewModel';
  static const String getAdvicesData = '/apiUserInterface/GetMedicalAdvices';
}