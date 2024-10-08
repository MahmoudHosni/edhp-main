import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';

const String baseUrl = 'https://edhp-eg.com';

class EndPoint {
  static const String login = '/apiAccount/Login';
  static const String register = '/apiAccount/Register';
  static const String getProfile = '/apiUserInterface/GetProfile';
  static const String updateProfile = '/apiUserInterface/UpdateProfile';
  static const String getOrganizations = '/apiUserInterface/GetOrganizations';
  static const String getMedicalCompanies = '/apiUserInterface/GetMICs';
  static const String updateProfileImage = '/apiAttachments/UpdateProfileImage';

  static const String getAppVerion = "/home/GetAppVersion";
  static const String GetMedicalEvents = "/apiUserInterface/GetMedicalEvents";
  static const String GetMedicalEventServices = '/apiUserInterface/GetMedicalEventServices?pageNumber=1&medicalEventID=';
  static const String GetEventServiceProvidersBranches = "/apiUserInterface/GetEventServiceProvidersBranches?pageNumber=1";
  static const String GetMedicalEventSubscriptionLookups = "/apiUserInterface/GetMedicalEventSubscriptionLookups?";
  static const String AddMedicalEventSubscription = "/apiUserInterface/AddMedicalEventSubscription";
  static const String CancelMedicalEventSubscription = "/apiUserInterface/CancelMedicalEventSubscription?MedicalEventID=";
  static const String DetailsAndConditionsOfEvent = "/apiUserInterface/GetMedicalEventDetails?medicalEventID=";

  static const String validateOrganizationMember =
      '/apiAccount/ValidateOrganizationMember';
  static const String getSubscriptionInfoLookUps =
      '/apiUserInterface/GetSubscriptionInfoLookupsViewModel';
  static const String updatePassword = '/apiUserInterface/UpdatePassword';

  static String getProfileImage(BuildContext context) {
    return '$baseUrl/apiAttachments/Get?referenceTypeId=${1}&referenceId=${GetProfileCubit.get(context).userProfileModel!.profileID}';
  }

  static const String imgPath = '/apiPublicUserInterface/GetImage';
  static const imageProfile = '/apiAttachments/Get';
  static const String organizationMemberSubscription =
      '/apiAccount/OrganizationMemberSubscription';
  static const String getNewAccessToken = '/apiAccount/GetNewToken';
  static const String getMembershipTypes =
      '/apiUserInterface/GetMembershipTypes'; //'/apiMembershipTypes/GetList';// https://edhp-eg.com/apiMembershipTypes/GetList
  static const String getSubscriptionInfoLookup =
      '/apiPublicUserInterface/GetSubscriptionInfoLookupsViewModel';
  static const String getStaticData =
      '/apiPublicUserInterface/GetSubscriptionInfoLookupsViewModel';
  static const String getAdvicesData = '/apiUserInterface/GetMedicalAdvices';
  static const String staticAds =
      'https://uicreative.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2021/02/22220740/auto-draft-1317-1024x683.jpg';
  static const String getAdvertisements = '/apiUserInterface/GetAdvertisements';
  static const String addNewSubscription =
      '/apiUserInterface/AddNewSubscription';
  static const String cancelMembershipRequest = '/apiUserInterface/GetOPayPaymentStatus';
  static const String addAnotherSubscription =
      '/apiUserInterface/AddNewSubscription';
  static const String getMySubscriptions =
      '/apiUserInterface/GetMySubscriptions';
  static const String getGovernorates = '/apiStates/GetList';
  static const String getAreas = '/ApiCity/GetListByStateID';
  static const String getServiceProvider =
      '/APIAndriodServicePorvider/GetSerivcePorviderBYType';
  static const String getServiceProviderBranches =
      '/APIAndriodServicePorvider/GetSerivcePorviderHospitalBranches';
  static const String getHospitalsLevels =
      '/APIAndriodServicePorvider/GetServicePorviderLevelsByType';
  static const String getDoctorsDegrees =
      '/APIAndriodServicePorvider/GetServicePorviderLevelsByType';
  static const String getHospitals =
      '/APIAndriodServicePorvider/GetSerivcePorviderHospital';
  static const String getDoctorsSpecialists =
      '/APIAndriodServicePorvider/GetSerivcePorviderDoctores';
  static const String getServices =
      '/APIAndriodServicePorvider/GetServiceByType';
  static const String getHospitalClinics =
      '/APIAndriodServicePorvider/GetClinicbyHospitalID';
  static const String getHospitalServices =
      '/APIAndriodServicePorvider/GetServicebyHospitalID';

  static const String getRelatives =
      '/apiUserInterface/GetMyFollowersSubscriptions';

  static const String getSubscriptionOrdersRequests =
      '/ApiSpSubscriptionRequests/GetMySpSubscriptionPayments';

  static const String getSubscriptionRequestServices =
      '/ApiSpSubscriptionRequests/GetSpSubscriptionServices';

  static const String cancelSubscriptionRequest = "/ApiSpSubscriptionRequests/Cancel";
}
