import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/confirm_membership_data/CardPreview.dart';
import 'package:edhp/features/confirm_membership_data/confirm_membership_data_screen.dart';
import 'package:edhp/features/create_membership/create_membership_screen.dart';
import 'package:edhp/features/edit_profile/edit_profile_screen.dart';
import 'package:edhp/features/home/widgets/MemberShipPreview.dart';
import 'package:edhp/features/insurance_companies/SelectInsuranceCompany.dart';
import 'package:edhp/features/layout/layout_screen.dart';
import 'package:edhp/features/medical_advices/MedicalAdvices.dart';
import 'package:edhp/features/medical_network/branches/medical_center_branches_screen.dart';
import 'package:edhp/features/medical_network/doctors/doctors_specialties/doctors_specialties_screen.dart';
import 'package:edhp/features/medical_network/hospitals/hospitals_data/hospitals_data_screen.dart';
import 'package:edhp/features/medical_network/hospitals/outpatient_clinics/outpatient_clinics_screen.dart';
import 'package:edhp/features/medical_network/labs/labs_data/labs_data_screen.dart';
import 'package:edhp/features/medical_network/medical_network_screen.dart';
import 'package:edhp/features/medical_network/medicl_devices/medical_devices_data/medicl_devices_data_screen.dart';
import 'package:edhp/features/medical_network/nearest_medical_centers/nearest_medical_centers_screen.dart';
import 'package:edhp/features/medical_network/pharmacies/pharmacies_data/pharmacies_data_screen.dart';
import 'package:edhp/features/medical_network/radiology_centers/radiology_centers_data/radiology_centers_data_screen.dart';
import 'package:edhp/features/medical_record/medical_record_screen.dart';
import 'package:edhp/features/membership_data/membership_data_screen.dart';
import 'package:edhp/features/otp/otp_screen.dart';
import 'package:edhp/features/payment/payment_screen.dart';
import 'package:edhp/features/service/MemberShipTypes.dart';
import 'package:edhp/features/service/service_screen.dart';
import 'package:edhp/features/splash_screen/splash_screen.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:go_router/go_router.dart';
import '../../features/add_relatives/add_relatives_screen.dart';
import '../../features/authantication/forget_password/forget_password_screen.dart';
import '../../features/authantication/login/login_screen.dart';
import '../../features/authantication/reset_password/reset_password_screen.dart';
import '../../features/authantication/sign_up/sign_up_screen.dart';
import '../../features/organization_membership/create_membership_inside_app/create_membership__inside_app_screen.dart';
import '../../features/organization_membership/organization_membership_data/organization_membership_data_screen.dart';
import '../../features/organization_membership/organization_subscription/organization_subscription_screen.dart';
import '../../features/organization_membership/select_the_company/select_the_company_screen.dart';
import '../../features/profile/profile_screen.dart';

abstract class AppRouters {
  static const kSplashScreen = '/';
  static const kLoginScreen = '/loginScreen';
  static const kForgetPasswordScreen = '/forgetPasswordScreen';
  static const kOtpScreen = '/otpScreen';
  static const kResetPasswordScreen = '/resetPasswordScreen';
  static const kSignUpScreen = '/signUpScreen';
  static const kHomeScreen = '/homeScreen';
  static const kLayoutScreen = '/layoutScreen';
  static const kEditProfileScreen = '/editProfileScreen';
  static const kServiceScreen = '/serviceScreen';
  static const kMemberShipTypes = '/memberShipTypes';
  static const kCreateMembershipScreen = '/createMembershipScreen';
  static const kMedicalNetworkScreen = '/medicalNetworkScreen';
  static const kHospitalsDataScreen = '/hospitalsDataScreen';
  static const kDoctorsSpecialtiesScreen = '/doctorsSpecialtiesScreen';
  static const kLabsDataScreen = '/labsDataScreen';
  static const kRadiologyCentersDataScreen = '/radiologyCentersDataScreen';
  static const kMedicalDevicesDataScreen = '/medicalDevicesDataScreen';
  static const kPharmaciesDataScreen = '/pharmaciesDataScreen';
  static const kMedicalCenterBranchesScreen = '/medicalCenterBranchesScreen';
  static const kOutpatientClinicsScreen = '/outpatientClinicsScreen';
  static const kNearestMedicalCentersScreen = '/nearestMedicalCentersScreen';
  static const kMedicalRecordScreen = '/medicalRecordScreen';
  static const kSelectCompanyScreen = '/selectCompanyScreen';
  static const kMembershipDataScreen = '/membershipDataScreen';
  static const kConfirmMembershipDataScreen = '/confirmMembershipDataScreen';
  static const kPaymentMembershipScreen = '/paymentMembershipScreen';
  static const kCardPreviewScreen = '/cardPreviewScreen';
  static const kMemberShipPreview = '/memberShipPreview';
  static const kProfileScreen = '/profileScreen';
  static const kOrganizationMembershipDataScreen = '/organizationMembershipDataScreen';
  static const kAddRelativesScreen = '/addRelativesScreen';
  static const kOrganizationSubscriptionScreen = '/organizationSubscriptionScreen';
  static const kCreateMembershipInsideAppScreen = '/createMembershipInsideAppScreen';
  static const kSelectInsuranceCompany = '/SelectInsuranceCompany';
  static const kMedicalAdvices = '/MedicalAdvices';

  static final baseRouter = GoRouter(redirect: (context, state) {
    String _token = CacheHelper.getData(key: 'token') ??'';
    print(_token);
    if(state.fullPath == kLoginScreen){
      if ((_token?.length ??0) >0){
        token = _token;
        return kLayoutScreen;
      }else {
        return kLoginScreen;
      }
    }else{
      return state.fullPath;
    }
  },
    routes: [
      GoRoute(
        path: kCreateMembershipInsideAppScreen ,
        builder: (context, state) => const CreateMembershipInsideAppScreen(),
      ),
      GoRoute(
        path: kOrganizationSubscriptionScreen ,
        builder: (context, state) => OrganizationSubscriptionScreen(),
      ),
      GoRoute(
        path: kSplashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) => OtpScreen(),
      ),
      GoRoute(
        path: kResetPasswordScreen,
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: kLayoutScreen,
        builder: (context, state) => LayoutScreen(),
      ),
      GoRoute(
        path: kEditProfileScreen,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: kServiceScreen,
        builder: (context, state) => ServiceScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMemberShipTypes,
        builder: (context, state) => MemberShipTypes(),
      ),
      GoRoute(
        path: kCreateMembershipScreen,
        builder: (context, state) => CreateMembershipScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMedicalNetworkScreen ,
        builder: (context, state) => const MedicalNetworkScreen(),
      ),
      GoRoute(
        path: kHospitalsDataScreen ,
        builder: (context, state) => const HospitalsDataScreen(),
      ),
      GoRoute(
        path: kDoctorsSpecialtiesScreen ,
        builder: (context, state) => const DoctorsSpecialtiesScreen(),
      ),
      GoRoute(
        path: kLabsDataScreen ,
        builder: (context, state) => const LabsDataScreen(),
      ),
      GoRoute(
        path: kRadiologyCentersDataScreen ,
        builder: (context, state) => const RadiologyCentersDataScreen(),
      ),
      GoRoute(
        path: kMedicalDevicesDataScreen ,
        builder: (context, state) => const MedicalDevicesDataScreen(),
      ),
      GoRoute(
        path: kPharmaciesDataScreen ,
        builder: (context, state) => const PharmaciesDataScreen(),
      ),
      GoRoute(
        path: kMedicalCenterBranchesScreen ,
        builder: (context, state) => const MedicalCenterBranchesScreen(),
      ),
      GoRoute(
        path: kOutpatientClinicsScreen ,
        builder: (context, state) => const OutpatientClinicsScreen(),
      ),
      GoRoute(
        path: kNearestMedicalCentersScreen ,
        builder: (context, state) => const NearestMedicalCentersScreen(),
      ),
      GoRoute(
        path: kMedicalRecordScreen ,
        builder: (context, state) => MedicalRecordScreen(),
      ),
      GoRoute(
        path: kSelectCompanyScreen ,
        builder: (context, state) => SelectTheCompanyScreen(),
      ),
      GoRoute(
        path: kMembershipDataScreen ,
        builder: (context, state) => MembershipDataScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kConfirmMembershipDataScreen,
        builder: (context, state) => ConfirmMembershipDataScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kPaymentMembershipScreen,
        builder: (context, state) => PaymentScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),//kCardPreviewScreen
      GoRoute(
        path: kCardPreviewScreen,
        builder: (context, state) => CardPreview(subscriptionRequest: state.extra as SubscriptionRequest),
      ),//MemberShipPreview
      GoRoute(
        path: kMemberShipPreview,
        builder: (context, state) => MemberShipPreview(),
      ),
      GoRoute(
        path: kProfileScreen ,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: kOrganizationMembershipDataScreen ,
        builder: (context, state) => OrganizationMembershipDataScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kAddRelativesScreen ,
        builder: (context, state) => AddRelativesScreen(),
      ),//
      GoRoute(
        path: kSelectInsuranceCompany ,
        builder: (context, state) => SelectInsuranceCompany(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMedicalAdvices ,
        builder: (context , state) => MedicalAdvices()),
    ],
  );

  static final skipLoginRouter = GoRouter(
    routes: [
      GoRoute(
        path: kLoginScreen,
        builder: (context, state) => LayoutScreen(),
      ),
      GoRoute(
        path: kForgetPasswordScreen,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: kOtpScreen,
        builder: (context, state) => OtpScreen(),
      ),
      GoRoute(
        path: kResetPasswordScreen,
        builder: (context, state) => ResetPasswordScreen(),
      ),
      GoRoute(
        path: kSignUpScreen,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: kLayoutScreen,
        builder: (context, state) => LayoutScreen(),
      ),
      GoRoute(
        path: kEditProfileScreen,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: kServiceScreen,
        builder: (context, state) => ServiceScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kCreateMembershipScreen,
        builder: (context, state) => CreateMembershipScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMedicalRecordScreen ,
        builder: (context, state) => MedicalRecordScreen(),
      ),
      GoRoute(
        path: kSelectCompanyScreen ,
        builder: (context, state) => SelectTheCompanyScreen(),
      ),
      GoRoute(
        path: kMembershipDataScreen ,
        builder: (context, state) => MembershipDataScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kConfirmMembershipDataScreen,
        builder: (context, state) => ConfirmMembershipDataScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kPaymentMembershipScreen,
        builder: (context, state) => PaymentScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kCardPreviewScreen,
        builder: (context, state) => CardPreview(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMemberShipPreview,
        builder: (context, state) => MemberShipPreview(),
      ),
      GoRoute(
        path: kProfileScreen ,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: kOrganizationMembershipDataScreen ,
        builder: (context, state) => OrganizationMembershipDataScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kAddRelativesScreen ,
        builder: (context, state) => AddRelativesScreen(),
      )
    ],
  );
}