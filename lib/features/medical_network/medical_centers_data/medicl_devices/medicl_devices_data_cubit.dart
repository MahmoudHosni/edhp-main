import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/medical_centers_data/medicl_devices/medicl_devices_data_states.dart';
import 'package:edhp/models/governorate_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalDevicesDataCubit extends Cubit<MedicalDevicesDataStates> {
  MedicalDevicesDataCubit() : super(MedicalDevicesDataInitialState()) {
    _getGovernorates();
  }

  static MedicalDevicesDataCubit get(context) => BlocProvider.of(context);

  List<GovernorateEntity> governorates = [GovernorateEntity(id: 0, name: '')];

  int _governorateId = 0;

  selectGovernorate({required int id}) {
    _governorateId = id;
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
