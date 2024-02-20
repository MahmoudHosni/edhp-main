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

  List<GovernorateEntity> governorates = [GovernorateEntity(id: 0, name: '')];

  int _governorateId = 0;
  String _searchText = '';

  selectGovernorate({required int id}) {
    _governorateId = id;
  }

  search({required String searchText}) {
    _searchText = searchText;
  }

  _getGovernorates() {
    DioHelper.getData(path: EndPoint.getGovernorates).then((governorates) {
      final governoratesList = governorates.data as List;
      this.governorates =
          governoratesList.map((i) => GovernorateEntity.fromJson(i)).toList();
      emit(HospitalsGetGovernoratesState());
    }).catchError(
      (error) {
        emit(HospitalsLoadErrorState());
      },
    );
  }
}
