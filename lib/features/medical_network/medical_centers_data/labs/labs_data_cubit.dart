import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/medical_centers_data/labs/labs_data_states.dart';
import 'package:edhp/models/areas_entity.dart';
import 'package:edhp/models/governorate_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabsDataCubit extends Cubit<LabsDataStates> {
  LabsDataCubit() : super(LabsDataInitialStates()) {
    _getGovernorates();
  }

  static LabsDataCubit get(context) => BlocProvider.of(context);

  List<ListStatesEntity> governorates = [ListStatesEntity(id: 0, name: '')];
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
      this.governorates =
          GovernorateEntity.fromJson(governorates.data).listStates;
      emit(LabsDataGetGovernoratesState());
    }).catchError(
      (error) {
        emit(LabsDataLoadErrorState());
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
      emit(LabsDataGetAreasState());
    }).catchError(
      (error) {
        emit(LabsDataLoadErrorState());
      },
    );
  }
}
