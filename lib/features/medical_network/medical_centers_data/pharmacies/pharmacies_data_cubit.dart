import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/medical_centers_data/pharmacies/pharmacies_states.dart';
import 'package:edhp/models/areas_entity.dart';
import 'package:edhp/models/governorate_entity.dart';
import 'package:edhp/models/service_provider_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmaciesDataCubit extends Cubit<PharmaciesDataStates> {
  PharmaciesDataCubit() : super(PharmaciesDataInitialState()) {
    _getPharmacies(_governorateId, _areaId, _searchText);
    _getGovernorates();
  }

  static PharmaciesDataCubit get(context) => BlocProvider.of(context);

  List<GovernorateEntity> governorates = [GovernorateEntity(id: 0, name: '')];
  List<AreasEntity> areas = [AreasEntity(id: 0, name: '')];
  List<ServiceProviderEntity> pharmacies = [];

  int _governorateId = 0;
  int _areaId = 0;
  String _searchText = '';

  selectGovernorate({required int id}) {
    _governorateId = id;
    _getPharmacies(_governorateId, _areaId, _searchText);
    _getAreas(governorateId: id);
  }

  selectArea({required int id}) {
    _areaId = id;
    _getPharmacies(_governorateId, _areaId, _searchText);
  }

  search({required String searchText}) {
    _searchText = searchText;
    _getPharmacies(_governorateId, _areaId, _searchText);
  }

  _getPharmacies(
    int governorateId,
    int areaId,
    String searchText,
  ) {
    DioHelper.getData(
      path: EndPoint.getServiceProvider,
      queryParameters: {
        'Type': 1007,
        'GovID': governorateId,
        'cityId': areaId,
        'name': searchText,
      },
    ).then(
      (pharmacies) {
        final labsList = pharmacies.data as List;
        this.pharmacies =
            labsList.map((i) => ServiceProviderEntity.fromJson(i)).toList();
        emit(PharmaciesDataGetPharmaciesState());
      },
    ).catchError(
      (error) {
        emit(PharmaciesDataLoadErrorState());
      },
    );
  }

  _getGovernorates() {
    DioHelper.getData(path: EndPoint.getGovernorates).then((governorates) {
      final governoratesList = governorates.data as List;
      this.governorates =
          governoratesList.map((i) => GovernorateEntity.fromJson(i)).toList();
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
