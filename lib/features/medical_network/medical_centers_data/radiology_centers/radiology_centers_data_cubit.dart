import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/medical_centers_data/radiology_centers/radiology_centers_data_states.dart';
import 'package:edhp/models/areas_entity.dart';
import 'package:edhp/models/governorate_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadiologyCentersDataCubit extends Cubit<RadiologyCentersDataStates> {
  RadiologyCentersDataCubit() : super(RadiologyCentersDataInitialState()) {
    _getGovernorates();
  }

  static RadiologyCentersDataCubit get(context) => BlocProvider.of(context);

  List<GovernorateEntity> governorates = [GovernorateEntity(id: 0, name: '')];
  List<AreasEntity> areas = [AreasEntity(id: 0, name: '')];

  int _governorateId = 0;
  int _areaId = 0;

  selectGovernorate({required int id}) {
    _governorateId = id;
    _getAreas(governorateId: id);
  }

  selectArea({required int id}) {
    _areaId = id;
  }

  _getGovernorates() {
    DioHelper.getData(path: EndPoint.getGovernorates).then((governorates) {
      final governoratesList = governorates.data as List;
      this.governorates =
          governoratesList.map((i) => GovernorateEntity.fromJson(i)).toList();
      emit(RadiologyCentersDataGetGovernoratesState());
    }).catchError(
      (error) {
        emit(RadiologyCentersDataLoadErrorState());
      },
    );
  }

  _getAreas({required int governorateId}) {
    DioHelper.getData(
      path: EndPoint.getAreas,
      queryParameters: {'id': governorateId},
    ).then((areas) {
      final areasList = areas.data as List;
      this.areas = areasList.map((i) => AreasEntity.fromJson(i)).toList();
      emit(RadiologyCentersDataGetAreasState());
    }).catchError(
      (error) {
        emit(RadiologyCentersDataLoadErrorState());
      },
    );
  }
}
