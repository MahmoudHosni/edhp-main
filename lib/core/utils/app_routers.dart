import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/MedicalEvent/ConditionsAndDetailsView.dart';
import 'package:edhp/features/MedicalEvent/MedicalEventBranchAndProviders.dart';
import 'package:edhp/features/MedicalEvent/MedicalEventServices.dart';
import 'package:edhp/features/MedicalEvent/MedicalEvents.dart';
import 'package:edhp/features/confirm_membership_data/CardPreview.dart';
import 'package:edhp/features/confirm_membership_data/confirm_membership_data_screen.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmResponse.dart';
import 'package:edhp/features/create_membership/create_membership_screen.dart';
import 'package:edhp/features/edit_profile/edit_profile_screen.dart';
import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:edhp/features/home/widgets/DescriptionView.dart';
import 'package:edhp/features/home/widgets/MemberShipPreview.dart';
import 'package:edhp/features/insurance_companies/SelectInsuranceCompany.dart';
import 'package:edhp/features/layout/layout_screen.dart';
import 'package:edhp/features/medical_advices/MedicalAdviceDetails.dart';
import 'package:edhp/features/medical_advices/MedicalAdvices.dart';
import 'package:edhp/features/medical_file/medical_file_screen.dart';
import 'package:edhp/features/medical_network/branches/medical_center_branches_screen.dart';
import 'package:edhp/features/medical_network/doctors/doctors_specialties/doctors_specialties_screen.dart';
import 'package:edhp/features/medical_network/doctors/nearest_doctors/nearest_doctors_screen.dart';
import 'package:edhp/features/medical_network/hospitals/hospital_services/hospital_services_screen.dart';
import 'package:edhp/features/medical_network/hospitals/hospitals_data/hospitals_data_screen.dart';
import 'package:edhp/features/medical_network/hospitals/nearest_hospitals/nearest_hospitals_screen.dart';
import 'package:edhp/features/medical_network/hospitals/outpatient_clinics/outpatient_clinics_screen.dart';
import 'package:edhp/features/medical_network/medical_centers_data/labs/labs_data_screen.dart';
import 'package:edhp/features/medical_network/medical_centers_data/medicl_devices/medicl_devices_data_screen.dart';
import 'package:edhp/features/medical_network/medical_centers_data/pharmacies/pharmacies_data_screen.dart';
import 'package:edhp/features/medical_network/medical_centers_data/radiology_centers/radiology_centers_data_screen.dart';
import 'package:edhp/features/medical_network/medical_cernter_services/medical_cernter_services_screen.dart';
import 'package:edhp/features/medical_network/medical_network_screen.dart';
import 'package:edhp/features/medical_network/nearest_medical_centers/nearest_medical_centers_screen.dart';
import 'package:edhp/features/medical_record/medical_record_screen.dart';
import 'package:edhp/features/individual_membership_data/membership_data_screen.dart';
import 'package:edhp/features/membership_selection/AllMemberships.dart';
import 'package:edhp/features/membership_selection/MembershipSelection.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/AddAnotherOrganizationMembership.dart';
import 'package:edhp/features/otp/otp_screen.dart';
import 'package:edhp/features/payment/CreatePaymentScreen.dart';
import 'package:edhp/features/payment/payment_screen.dart';
import 'package:edhp/features/payment_orders/model/PaymentSubscriptionOrder.dart';
import 'package:edhp/features/payment_orders/pages/PaymentCashVisaScreen.dart';
import 'package:edhp/features/payment_orders/pages/PaymentOrderDetails.dart';
import 'package:edhp/features/payment_orders/pages/PaymentOrdersPage.dart';
import 'package:edhp/features/relatives/add/add_relatives_screen.dart';
import 'package:edhp/features/relatives/show/AllRelativesScreen.dart';
import 'package:edhp/features/service/MemberShipTypes.dart';
import 'package:edhp/features/service/ServiceDetailsview.dart';
import 'package:edhp/features/service/service_screen.dart';
import 'package:edhp/features/settings/reset_password/reset_password_screen.dart';
import 'package:edhp/features/splash_screen/splash_screen.dart';
import 'package:edhp/models/EventWithBranchObjects.dart';
import 'package:edhp/models/Medical.dart';
import 'package:edhp/models/MedicalEvent.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:edhp/models/medical_network_entity.dart';
import 'package:edhp/models/membership_type_model.dart';
import 'package:go_router/go_router.dart';
import '../../features/authantication/forget_password/forget_password_screen.dart';
import '../../features/authantication/login/login_screen.dart';
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
  static const kMembershipSelection = "/MembershipSelection";
  static const kMedicalEvents = '/MedicalEvents';
  static const kMedicalEventServics = '/MedicalEventServics';
  static const kMedicalEventConditionsAndDetails = '/ConditionsAndDetails';
  static const kMedicalEventCenters = '/MedicalEventCenters';
  static const kCreatePaymentScreen = "/CreatePaymentScreen";
  static const kMemberShipTypes = '/memberShipTypes';
  static const kCreateMembershipScreen = '/createMembershipScreen';
  static const kMedicalNetworkScreen = '/medicalNetworkScreen';
  static const kAllMemberships = '/AllMemberships';
  static const kHospitalsDataScreen = '/hospitalsDataScreen';
  static const kDoctorsSpecialtiesScreen = '/doctorsSpecialtiesScreen';
  static const kLabsDataScreen = '/labsDataScreen';
  static const kRadiologyCentersDataScreen = '/radiologyCentersDataScreen';
  static const kMedicalDevicesDataScreen = '/medicalDevicesDataScreen';
  static const kPharmaciesDataScreen = '/pharmaciesDataScreen';
  static const kMedicalCenterBranchesScreen = '/medicalCenterBranchesScreen';
  static const kOutpatientClinicsScreen = '/outpatientClinicsScreen';
  static const kHospitalServicesScreen = '/hospitalServicesScreen';
  static const kNearestMedicalCentersScreen = '/nearestMedicalCentersScreen';
  static const kNearestHospitalsScreen = '/nearestHospitalsScreen';
  static const kNearestDoctorsScreen = '/nearestDoctorsScreen';
  static const kMedicalCenterServicesScreen = '/medicalCenterServicesScreen';
  static const kMedicalRecordScreen = '/medicalRecordScreen';
  static const kMedicalFileScreen = '/medicalFileScreen';
  static const kSelectCompanyScreen = '/selectCompanyScreen';
  static const kMembershipDataScreen = '/membershipDataScreen';
  static const kConfirmMembershipDataScreen = '/confirmMembershipDataScreen';
  static const kServiceDetailsview = "/kServiceDetailsview";
  static const kMedicalAdviceDetails = "/kMedicalAdviceDetails";
  static const kPaymentMembershipScreen = '/paymentMembershipScreen';
  static const kCardPreviewScreen = '/cardPreviewScreen';
  static const kMemberShipPreview = '/memberShipPreview';
  static const kProfileScreen = '/profileScreen';
  static const kOrganizationMembershipDataScreen = '/organizationMembershipDataScreen';
  static const kAddAnotherOrganizationMembership = '/AddAnotherOrganizationMembership';
  static const kAddRelativesScreen = '/addRelativesScreen';
  static const kOrganizationSubscriptionScreen = '/organizationSubscriptionScreen';
  static const kCreateMembershipInsideAppScreen = '/createMembershipInsideAppScreen';
  static const kSelectInsuranceCompany = '/SelectInsuranceCompany';
  static const kMedicalAdvices = '/MedicalAdvices';
  static const kShowFileContent = "/DescriptionView";
  static const kAllRelativesScreen = "/AllRelativesScreen";
  static const kPaymentOrdersPage = "/PaymentOrdersPage";
  static const kPaymentOrderDetails = "/PaymentOrderDetails";
  static const kPaymentCashVisaScreen = "/PaymentCashVisaScreen";
  static const kPayOrderRequest = "/PayOrderRequest";

  static final baseRouter = GoRouter(
    redirect: (context, state) {
      String _token = CacheHelper.getData(key: Token) ?? '';
      print(_token);
      if (state.fullPath == kLoginScreen) {
        if ((_token?.length ?? 0) > 0) {
          token = _token;
          return kLayoutScreen;
        } else {
          return kLoginScreen;
        }
      } else {
        return state.fullPath;
      }
    },
    routes: [
      GoRoute(
        path: kCreateMembershipInsideAppScreen,
        builder: (context, state) => const CreateMembershipInsideAppScreen(),
      ),
      GoRoute(
        path: kOrganizationSubscriptionScreen,
        builder: (context, state) => OrganizationSubscriptionScreen(),
      ),//
      GoRoute(
        path: kAllRelativesScreen,
        builder: (context, state) => AllRelativesScreen(),
      ),
      GoRoute(
        path: kPaymentOrdersPage,
        builder: (context, state) => PaymentOrdersPage(),
      ),//
      GoRoute(
        path: kPaymentOrderDetails,
        builder: (context, state) => PaymentOrderDetails(order: state.extra as PaymentSubscriptionOrder),
      ),//
      GoRoute(
        path: kPaymentCashVisaScreen,
        builder: (context, state) => PaymentCashVisaScreen(request: state.extra as PaymentSubscriptionOrder),
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
        builder: (context, state) => EditProfileScreen(
          memberShip:
              state.extra != null ? (state.extra as MemberShipsResponse) : null,
        ),
      ),
      GoRoute(
        path: kServiceScreen,
        builder: (context, state) => ServiceScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),//kMembershipSelection
      GoRoute(
        path: kMembershipSelection,
        builder: (context, state) => MembershipSelection(
            memberShips: state.extra as List<MemberShipsResponse>),
      ),
      GoRoute(
        path: kMedicalEvents,
        builder: (context, state) => MedicalEvents(),
      ),//kMedicalEventCenters
      GoRoute(
        path: kMedicalEventCenters,
        builder: (context, state) => MedicalEventBranchAndProviders(mEvent: state.extra as EventWithBranchObjects),
      ),//kMedicalEventServics
      GoRoute(path: kCreatePaymentScreen,
        builder: (context, state) => CreatePaymentScreen(confirmResponse: state.extra as ConfirmResponse),),
      GoRoute(
        path: kMedicalEventServics,
        builder: (context, state) => MedicalEventServices(medicalEvent: state.extra as MedicalEvent),
      ),
      GoRoute(
        path: kMedicalEventConditionsAndDetails,
        builder: (context, state) => ConditionsAndDetailsView(event: state.extra as MedicalEvent),
      ),
      GoRoute(
        path: kMemberShipTypes,
        builder: (context, state) => MemberShipTypes(),
      ),
      GoRoute(
        path: kCreateMembershipScreen,
        builder: (context, state) => CreateMembershipScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMedicalNetworkScreen,
        builder: (context, state) => const MedicalNetworkScreen(),
      ),//kAllMemberships
      GoRoute(
        path: kAllMemberships,
        builder: (context, state) => AllMemberships(memberShips: state.extra as List<MemberShipsResponse>),
      ),
      GoRoute(
        path: kHospitalsDataScreen,
        builder: (context, state) => HospitalsDataScreen(),
      ),
      GoRoute(
        path: kDoctorsSpecialtiesScreen,
        builder: (context, state) => DoctorsSpecialtiesScreen(),
      ),
      GoRoute(
        path: kLabsDataScreen,
        builder: (context, state) => LabsDataScreen(),
      ),
      GoRoute(
        path: kRadiologyCentersDataScreen,
        builder: (context, state) => RadiologyCentersDataScreen(),
      ),
      GoRoute(
        path: kMedicalDevicesDataScreen,
        builder: (context, state) => MedicalDevicesDataScreen(),
      ),
      GoRoute(
        path: kPharmaciesDataScreen,
        builder: (context, state) => PharmaciesDataScreen(),
      ),
      GoRoute(
        path: kMedicalCenterBranchesScreen,
        builder: (context, state) => MedicalCenterBranchesScreen(
          medicalCenterEntity: state.extra as MedicalCenterEntity,
        ),
      ),
      GoRoute(
        path: kOutpatientClinicsScreen,
        builder: (context, state) => OutpatientClinicsScreen(
          hospitalId: state.extra as int,
        ),
      ),
      GoRoute(
        path: kHospitalServicesScreen,
        builder: (context, state) => HospitalServicesScreen(
          hospitalId: state.extra as int,
        ),
      ),
      GoRoute(
        path: kNearestMedicalCentersScreen,
        builder: (context, state) => NearestMedicalCentersScreen(
          medicalCenterEntity: state.extra as MedicalCenterEntity,
        ),
      ),
      GoRoute(
        path: kNearestHospitalsScreen,
        builder: (context, state) => const NearestHospitalsScreen(),
      ),
      GoRoute(
        path: kNearestDoctorsScreen,
        builder: (context, state) => const NearestDoctorsScreen(),
      ),
      GoRoute(
        path: kMedicalCenterServicesScreen,
        builder: (context, state) => MedicalCenterServicesScreen(
          medicalCenterEntity: state.extra as MedicalCenterEntity,
        ),
      ),
      GoRoute(
        path: kMedicalRecordScreen,
        builder: (context, state) => MedicalRecordScreen(),
      ),
      GoRoute(
        path: kMedicalFileScreen,
        builder: (context, state) => MedicalFileScreen(),
      ),
      GoRoute(
        path: kSelectCompanyScreen,
        builder: (context, state) => SelectTheCompanyScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMembershipDataScreen,
        builder: (context, state) => MembershipDataScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kConfirmMembershipDataScreen,
        builder: (context, state) => ConfirmMembershipDataScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),//kServiceDetailsview
      GoRoute(
        path: kServiceDetailsview,
        builder: (context, state) => ServiceDetailsview(
            membershipType: state.extra as MembershipType),
      ),//
      GoRoute(
        path: kMedicalAdviceDetails,
        builder: (context, state) => MedicalAdviceDetails(
            advice: state.extra as MedicalAdvice),
      ),
      GoRoute(
        path: kPaymentMembershipScreen,
        builder: (context, state) => PaymentScreen(
            confirmResponse: state.extra as ConfirmResponse),
      ), //kCardPreviewScreen
      GoRoute(
        path: kCardPreviewScreen,
        builder: (context, state) =>
            CardPreview(subscriptionRequest: state.extra as ConfirmResponse),
      ), //MemberShipPreview
      GoRoute(
        path: kMemberShipPreview,
        builder: (context, state) => MemberShipPreview(memberShip: state.extra as MemberShipsResponse),
      ),
      GoRoute(
        path: kProfileScreen,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: kOrganizationMembershipDataScreen,
        builder: (context, state) => OrganizationMembershipDataScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kAddAnotherOrganizationMembership,
        builder: (context, state) => AddAnotherOrganizationMembership(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kAddRelativesScreen,
        builder: (context, state) => AddRelativesScreen(subscribtionRequest: state.extra as SubscriptionRequest),
      ), //
      GoRoute(
        path: kSelectInsuranceCompany,
        builder: (context, state) => SelectInsuranceCompany(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
          path: kMedicalAdvices, builder: (context, state) => MedicalAdvices()),
      GoRoute(
          path: kShowFileContent,
          builder: (context, state) => DescriptionView(
              fileName: (state.extra as List<String>)[0],
              title: (state.extra as List<String>)[1])),
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
        builder: (context, state) => EditProfileScreen(
            memberShip: state.extra != null
                ? (state.extra as MemberShipsResponse)
                : null),
      ),
      GoRoute(
        path: kAllMemberships,
        builder: (context, state) => AllMemberships(memberShips: state.extra as List<MemberShipsResponse>),
      ),
      GoRoute(
        path: kServiceScreen,
        builder: (context, state) => ServiceScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMembershipSelection,
        builder: (context, state) => MembershipSelection(
            memberShips: state.extra as List<MemberShipsResponse>),
      ),
      GoRoute(
        path: kAllRelativesScreen,
        builder: (context, state) => AllRelativesScreen(),
      ),
      GoRoute(
        path: kPaymentOrdersPage,
        builder: (context, state) => PaymentOrdersPage(),
      ),
      GoRoute(
        path: kPaymentOrderDetails,
        builder: (context, state) => PaymentOrderDetails(order: state.extra as PaymentSubscriptionOrder),
      ),
      GoRoute(
        path: kPaymentCashVisaScreen,
        builder: (context, state) => PaymentCashVisaScreen(request: state.extra as PaymentSubscriptionOrder),
      ),
      GoRoute(
        path: kMedicalEvents,
        builder: (context, state) => MedicalEvents(),
      ),
      GoRoute(
        path: kMedicalEventServics,
        builder: (context, state) => MedicalEventServices(medicalEvent: state.extra as MedicalEvent),
      ),
      GoRoute(
        path: kMedicalEventConditionsAndDetails,
        builder: (context, state) => ConditionsAndDetailsView(event: state.extra as MedicalEvent),
      ),
      GoRoute(
        path: kMedicalEventCenters,
        builder: (context, state) => MedicalEventBranchAndProviders(mEvent: state.extra as EventWithBranchObjects),
      ),
      GoRoute(path: kCreatePaymentScreen,
        builder: (context, state) => CreatePaymentScreen(confirmResponse: state.extra as ConfirmResponse),),
      GoRoute(
        path: kCreateMembershipScreen,
        builder: (context, state) => CreateMembershipScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMedicalRecordScreen,
        builder: (context, state) => MedicalRecordScreen(),
      ),
      GoRoute(
        path: kMedicalFileScreen,
        builder: (context, state) => MedicalFileScreen(),
      ),
      GoRoute(
        path: kSelectCompanyScreen,
        builder: (context, state) => SelectTheCompanyScreen(subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kMembershipDataScreen,
        builder: (context, state) => MembershipDataScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kConfirmMembershipDataScreen,
        builder: (context, state) => ConfirmMembershipDataScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kServiceDetailsview,
        builder: (context, state) => ServiceDetailsview(
            membershipType: state.extra as MembershipType),
      ),
      GoRoute(
        path: kMedicalAdviceDetails,
        builder: (context, state) => MedicalAdviceDetails(
            advice: state.extra as MedicalAdvice),
      ),
      GoRoute(
        path: kPaymentMembershipScreen,
        builder: (context, state) => PaymentScreen(
            confirmResponse: state.extra as ConfirmResponse),
      ),
      GoRoute(
        path: kCardPreviewScreen,
        builder: (context, state) =>
            CardPreview(subscriptionRequest: state.extra as ConfirmResponse),
      ),
      GoRoute(
        path: kMemberShipPreview,
        builder: (context, state) => MemberShipPreview(memberShip: state.extra as MemberShipsResponse),
      ),
      GoRoute(
        path: kProfileScreen,
        builder: (context, state) => ProfileScreen(),
      ),
      GoRoute(
        path: kOrganizationMembershipDataScreen,
        builder: (context, state) => OrganizationMembershipDataScreen(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kAddAnotherOrganizationMembership,
        builder: (context, state) => AddAnotherOrganizationMembership(
            subscriptionRequest: state.extra as SubscriptionRequest),
      ),
      GoRoute(
        path: kAddRelativesScreen,
        builder: (context, state) => AddRelativesScreen(subscribtionRequest: state.extra as SubscriptionRequest),
      )
    ],
  );
}
