import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/hospitals/hospitals_data/hospitals_data_states.dart';
import 'package:edhp/models/hospital_entity.dart';
import 'package:edhp/models/lookup_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalsDataCubit extends Cubit<HospitalsDataStates> {
  HospitalsDataCubit() : super(HospitalsDataInitialState()) {
    _getHospitals();
    _getGovernorates();
    _getLevels();
    _getServices();
  }

  static HospitalsDataCubit get(context) => BlocProvider.of(context);

  List<LookupEntity> governorates = [LookupEntity(id: 0, name: '')];
  List<LookupEntity> levels = [LookupEntity(id: 0, name: '')];
  List<LookupEntity> services = [LookupEntity(id: 0, name: '')];
  List<HospitalEntity> hospitals = [];

  int _governorateId = 0;
  int _levelsId = 0;
  int _serviceId = 0;
  String _searchText = '';

  selectGovernorate({required int id}) {
    _governorateId = id;
    _getHospitals();
  }

  selectLevel({required int id}) {
    _levelsId = id;
    _getHospitals();
  }

  selectService({required int id}) {
    _serviceId = id;
    _getHospitals();
  }

  search({required String searchText}) {
    _searchText = searchText;
    _getHospitals();
  }

  _getHospitals() {
    emit(HospitalsLoadingState());
    DioHelper.getData(
      path: EndPoint.getHospitals,
      queryParameters: {
        'GovID': _governorateId,
        'LevelID': _levelsId,
        'SerivceID': _serviceId,
        'name': _searchText,
      },
    ).then(
      (hospitals) {
        final hospitalsList = hospitals.data as List;
        this.hospitals =
            hospitalsList.map((i) => HospitalEntity.fromJson(i)).toList();
        emit(HospitalsGetHospitalsState());
      },
    ).catchError(
      (error) {
        emit(HospitalsLoadErrorState());
      },
    );
  }

  _getGovernorates() {
    DioHelper.getData(path: EndPoint.getGovernorates).then(
      (governorates) {
        final governoratesList = governorates.data as List;
        this.governorates =
            governoratesList.map((i) => LookupEntity.fromJson(i)).toList();
        emit(HospitalsGetGovernoratesState());
      },
    ).catchError(
      (error) {
        emit(HospitalsLoadErrorState());
      },
    );
  }

  _getLevels() {
    DioHelper.getData(
      path: EndPoint.getHospitalsLevels,
      queryParameters: {
        'Type': '1004',
      },
    ).then(
      (levels) {
        final levelsList = levels.data as List;
        this.levels = levelsList.map((i) => LookupEntity.fromJson(i)).toList();
        emit(HospitalsGetLevelsState());
      },
    ).catchError(
      (onError) {
        emit(HospitalsLoadErrorState());
      },
    );
  }

  _getServices() {
    DioHelper.getData(
      path: EndPoint.getHospitalServices,
      queryParameters: {
        'Type': '1004',
      },
    ).then(
      (services) {
        final levelsList = services.data as List;
        this.services = levelsList.map((i) => LookupEntity.fromJson(i)).toList();
        emit(HospitalsGetServicesState());
      },
    ).catchError(
      (onError) {
        emit(HospitalsLoadErrorState());
      },
    );
  }
}
