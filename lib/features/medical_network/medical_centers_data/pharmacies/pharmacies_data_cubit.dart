import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/medical_centers_data/pharmacies/pharmacies_states.dart';
import 'package:edhp/models/lookup_entity.dart';
import 'package:edhp/models/service_provider_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmaciesDataCubit extends Cubit<PharmaciesDataStates> {
  PharmaciesDataCubit() : super(PharmaciesDataInitialState()) {
    _getPharmacies();
    _getGovernorates();
  }

  static PharmaciesDataCubit get(context) => BlocProvider.of(context);

  List<LookupEntity> governorates = [LookupEntity(id: 0, name: '')];
  List<LookupEntity> areas = [LookupEntity(id: 0, name: '')];
  List<ServiceProviderEntity> pharmacies = [];

  int _governorateId = 0;
  int _areaId = 0;
  String _searchText = '';

  selectGovernorate({required int id}) {
    _governorateId = id;
    _areaId = 0;
    _getPharmacies();
    _getAreas(governorateId: id);
  }

  selectArea({required int id}) {
    _areaId = id;
    _getPharmacies();
  }

  search({required String searchText}) {
    _searchText = searchText;
    _getPharmacies();
  }

  _getPharmacies() {
    emit(PharmaciesDataLoadingState());
    DioHelper.getData(
      path: EndPoint.getServiceProvider,
      queryParameters: {
        'Type': 1007,
        'GovID': _governorateId,
        'cityId': _areaId,
        'Name': _searchText,
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
          governoratesList.map((i) => LookupEntity.fromJson(i)).toList();
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
      this.areas = areasList.map((i) => LookupEntity.fromJson(i)).toList();
      emit(PharmaciesDataGetAreasState());
    }).catchError(
      (error) {
        emit(PharmaciesDataLoadErrorState());
      },
    );
  }
}
