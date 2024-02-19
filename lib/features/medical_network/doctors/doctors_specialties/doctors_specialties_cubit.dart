import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/doctors/doctors_specialties/doctors_specialties_states.dart';
import 'package:edhp/models/areas_entity.dart';
import 'package:edhp/models/governorate_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsSpecialtiesCubit extends Cubit<DoctorsSpecialtiesStates> {
  DoctorsSpecialtiesCubit() : super(DoctorsSpecialtiesInitialState()) {
    _getGovernorates();
  }

  List<GovernorateEntity> governorates = [GovernorateEntity(id: 0, name: '')];
  List<AreasEntity> areas = [AreasEntity(id: 0, name: '')];

  static DoctorsSpecialtiesCubit get(context) => BlocProvider.of(context);

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
      emit(DoctorsSpecialtiesGetGovernoratesState());
    }).catchError(
      (error) {
        emit(DoctorsSpecialtiesLoadErrorState());
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
      emit(DoctorsSpecialtiesGetAreasState());
    }).catchError(
      (error) {
        emit(DoctorsSpecialtiesLoadErrorState());
      },
    );
  }
}
