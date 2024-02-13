import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/hospitals/hospitals_data/hospitals_data_states.dart';
import 'package:edhp/models/governorate_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalsDataCubit extends Cubit<HospitalsDataStates> {
  HospitalsDataCubit() : super(HospitalsDataInitialState()) {
    _getGovernorates();
  }

  static HospitalsDataCubit get(context) => BlocProvider.of(context);

  List<ListStatesEntity> governorates = [ListStatesEntity(id: 0, name: '')];

  int _governorateId = 0;

  selectGovernorate({required int id}) {
    _governorateId = id;
  }

  _getGovernorates() {
    DioHelper.getData(path: EndPoint.getGovernorates).then((governorates) {
      this.governorates =
          GovernorateEntity.fromJson(governorates.data).listStates;
      emit(HospitalsGetGovernoratesState());
    }).catchError(
      (error) {
        emit(HospitalsLoadErrorState());
      },
    );
  }
}
