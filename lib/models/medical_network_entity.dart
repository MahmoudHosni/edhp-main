import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_routers.dart';

class MedicalNetworkEntity {
  final String title;
  final String router;

  MedicalNetworkEntity({
    required this.title,
    required this.router,
  });
}

final List<MedicalNetworkEntity> medicalNetworkList = [
  MedicalNetworkEntity(
    title: StringsManager.hospitals.tr(),
    router: AppRouters.kHospitalsDataScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.doctors.tr(),
    router: AppRouters.kDoctorsSpecialtiesScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.labs.tr(),
    router: AppRouters.kLabsDataScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.radiologyCenters.tr(),
    router: AppRouters.kRadiologyCentersDataScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.medicalDevices.tr(),
    router: AppRouters.kMedicalDevicesDataScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.pharmacies.tr(),
    router: AppRouters.kPharmaciesDataScreen,
  ),
];

class MedicalCenterEntity {
  final MedicalCenterType medicalCenterType;
  final String title;

  MedicalCenterEntity({
    required this.medicalCenterType,
    required this.title,
  });
}

enum MedicalCenterType { labs, radiologyCenters, pharmacies, medicalDevices }
