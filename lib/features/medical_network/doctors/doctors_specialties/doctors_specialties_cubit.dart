import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/doctors/doctors_specialties/doctors_specialties_states.dart';
import 'package:edhp/models/doctor_degree_entity.dart';
import 'package:edhp/models/doctor_specialist_entity.dart';
import 'package:edhp/models/lookup_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsSpecialtiesCubit extends Cubit<DoctorsSpecialtiesStates> {
  DoctorsSpecialtiesCubit() : super(DoctorsSpecialtiesInitialState()) {
    _getDoctorSpecialists();
    _getGovernorates();
    _getDegrees();
  }

  List<LookupEntity> governorates = [LookupEntity(id: 0, name: '')];
  List<LookupEntity> areas = [LookupEntity(id: 0, name: '')];
  List<DoctorDegreesEntity> degrees = [DoctorDegreesEntity(id: 0, name: '')];
  List<DoctorSpecialistEntity> doctorsSpecialists = [];

  static DoctorsSpecialtiesCubit get(context) => BlocProvider.of(context);

  int _governorateId = 0;
  int _areaId = 0;
  int _degreeId = 0;
  String _searchText = '';

  selectGovernorate({required int id}) {
    _governorateId = id;
    _areaId = 0;
    _getDoctorSpecialists();
    _getAreas(governorateId: id);
  }

  selectArea({required int id}) {
    _areaId = id;
    _getDoctorSpecialists();
  }

  selectDegree({required int id}) {
    _degreeId = id;
    _getDoctorSpecialists();
  }

  search({required String searchText}) {
    _searchText = searchText;
    _getDoctorSpecialists();
  }

  _getDoctorSpecialists() {
    emit(DoctorsSpecialtiesLoadingState());
    DioHelper.getData(
      path: EndPoint.getDoctorsSpecialists,
      queryParameters: {
        'GovID': _governorateId,
        'CityID': _areaId,
        'LevelID': _degreeId,
        'name': _searchText,
      },
    ).then(
      (doctorsSpecialists) {
        final doctorsSpecialistsList = doctorsSpecialists.data as List;
        this.doctorsSpecialists = doctorsSpecialistsList
            .map((i) => DoctorSpecialistEntity.fromJson(i))
            .toList();
        emit(DoctorsSpecialtiesLoadErrorState());
      },
    ).catchError(
      (error) {
        emit(DoctorsSpecialtiesLoadErrorState());
      },
    );
  }

  _getGovernorates() {
    DioHelper.getData(path: EndPoint.getGovernorates).then((governorates) {
      final governoratesList = governorates.data as List;
      this.governorates =
          governoratesList.map((i) => LookupEntity.fromJson(i)).toList();
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
      this.areas = areasList.map((i) => LookupEntity.fromJson(i)).toList();
      emit(DoctorsSpecialtiesGetAreasState());
    }).catchError(
      (error) {
        emit(DoctorsSpecialtiesLoadErrorState());
      },
    );
  }

  _getDegrees() {
    DioHelper.getData(
      path: EndPoint.getDoctorsDegrees,
      queryParameters: {
        'Type': '4',
      },
    ).then(
      (degrees) {
        final levelsList = degrees.data as List;
        this.degrees =
            levelsList.map((i) => DoctorDegreesEntity.fromJson(i)).toList();
        emit(DoctorsSpecialtiesGetDegreesState());
      },
    ).catchError(
      (onError) {
        emit(DoctorsSpecialtiesLoadErrorState());
      },
    );
  }
}
