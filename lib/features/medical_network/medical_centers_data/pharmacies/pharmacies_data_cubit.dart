import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/medical_centers_data/pharmacies/pharmacies_states.dart';
import 'package:edhp/models/areas_entity.dart';
import 'package:edhp/models/governorate_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmaciesDataCubit extends Cubit<PharmaciesDataStates> {
  PharmaciesDataCubit() : super(PharmaciesDataInitialState()) {
    _getGovernorates();
  }

  static PharmaciesDataCubit get(context) => BlocProvider.of(context);

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
      emit(PharmaciesDataGetGovernoratesState());
    }).catchError(
      (error) {
        emit(PharmaciesDataLoadErrorState());
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
      emit(PharmaciesDataGetAreasState());
    }).catchError(
      (error) {
        emit(PharmaciesDataLoadErrorState());
      },
    );
  }
}
