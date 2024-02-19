import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/medical_centers_data/medicl_devices/medicl_devices_data_states.dart';
import 'package:edhp/models/governorate_entity.dart';
import 'package:edhp/models/service_provider_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalDevicesDataCubit extends Cubit<MedicalDevicesDataStates> {
  MedicalDevicesDataCubit() : super(MedicalDevicesDataInitialState()) {
    _getMedicalDevices();
    _getGovernorates();
  }

  static MedicalDevicesDataCubit get(context) => BlocProvider.of(context);

  List<GovernorateEntity> governorates = [GovernorateEntity(id: 0, name: '')];
  List<ServiceProviderEntity> medicalDevices = [];

  int _governorateId = 0;

  selectGovernorate({required int id}) {
    _governorateId = id;
  }

  _getMedicalDevices() {
    DioHelper.getData(
      path: EndPoint.getServiceProvider,
      queryParameters: {'Type': 1011},
    ).then(
      (medicalDevices) {
        final labsList = medicalDevices.data as List;
        this.medicalDevices =
            labsList.map((i) => ServiceProviderEntity.fromJson(i)).toList();
        emit(MedicalDevicesDataGetMedicalDevicesState());
      },
    ).catchError(
      (error) {
        emit(MedicalDevicesDataLoadErrorState());
      },
    );
  }

  _getGovernorates() {
    DioHelper.getData(path: EndPoint.getGovernorates).then((governorates) {
      final governoratesList = governorates.data as List;
      this.governorates =
          governoratesList.map((i) => GovernorateEntity.fromJson(i)).toList();
      emit(MedicalDevicesDataGetGovernoratesState());
    }).catchError(
      (error) {
        emit(MedicalDevicesDataLoadErrorState());
      },
    );
  }
}
