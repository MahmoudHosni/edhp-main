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
    title: StringsManager.hospitals,
    router: AppRouters.kHospitalsDataScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.doctors,
    router: AppRouters.kDoctorsSpecialtiesScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.labs,
    router: AppRouters.kLabsDataScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.radiologyCenters,
    router: AppRouters.kRadiologyCentersDataScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.medicalDevices,
    router: AppRouters.kMedicalDevicesDataScreen,
  ),
  MedicalNetworkEntity(
    title: StringsManager.pharmacies,
    router: AppRouters.kPharmaciesDataScreen,
  ),
];
