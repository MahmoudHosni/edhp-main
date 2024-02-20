import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/medical_centers_data/labs/labs_data_states.dart';
import 'package:edhp/models/areas_entity.dart';
import 'package:edhp/models/governorate_entity.dart';
import 'package:edhp/models/service_provider_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabsDataCubit extends Cubit<LabsDataStates> {
  LabsDataCubit() : super(LabsDataInitialStates()) {
    _getLabs(_governorateId, _areaId, _searchText);
    _getGovernorates();
  }

  static LabsDataCubit get(context) => BlocProvider.of(context);

  List<GovernorateEntity> governorates = [GovernorateEntity(id: 0, name: '')];
  List<AreasEntity> areas = [AreasEntity(id: 0, name: '')];
  List<ServiceProviderEntity> labs = [];

  int _governorateId = 0;
  int _areaId = 0;
  String _searchText = '';

  selectGovernorate({required int id}) {
    _governorateId = id;
    _getLabs(_governorateId, _areaId, _searchText);
    _getAreas(governorateId: id);
  }

  selectArea({required int id}) {
    _areaId = id;
    _getLabs(_governorateId, _areaId, _searchText);
  }

  search({required String searchText}) {
    _searchText = searchText;
    _getLabs(_governorateId, _areaId, _searchText);
  }

  _getLabs(
    int governorateId,
    int areaId,
    String searchText,
  ) {
    DioHelper.getData(
      path: EndPoint.getServiceProvider,
      queryParameters: {
        'Type': 1005,
        'GovID': governorateId,
        'cityId': areaId,
        'name': searchText,
      },
    ).then(
      (labs) {
        final labsList = labs.data as List;
        this.labs =
            labsList.map((i) => ServiceProviderEntity.fromJson(i)).toList();
        emit(LabsDataGetLabsState());
      },
    ).catchError(
      (error) {
        emit(LabsDataLoadErrorState());
      },
    );
  }

  _getGovernorates() {
    DioHelper.getData(
      path: EndPoint.getGovernorates,
    ).then(
      (governorates) {
        final governoratesList = governorates.data as List;
        this.governorates =
            governoratesList.map((i) => GovernorateEntity.fromJson(i)).toList();
        emit(LabsDataGetGovernoratesState());
      },
    ).catchError(
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
