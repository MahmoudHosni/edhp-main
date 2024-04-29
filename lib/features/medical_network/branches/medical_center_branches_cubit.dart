import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/branches/medical_center_branches_states.dart';
import 'package:edhp/models/lookup_entity.dart';
import 'package:edhp/models/medical_center_branch_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalCenterBranchesCubit extends Cubit<MedicalCenterBranchesStates> {
  MedicalCenterBranchesCubit({
    required this.medicalCenterId,
  }) : super(MedicalCenterBranchesInitialState()) {
    _getGovernorates();
    _getBranches();
  }

  static MedicalCenterBranchesCubit get(context) => BlocProvider.of(context);

  final int medicalCenterId;

  List<MedicalCenterBranchEntity> branches = [];
  List<LookupEntity> governorates = [LookupEntity(id: 0, name: '')];
  List<LookupEntity> areas = [LookupEntity(id: 0, name: '')];

  int _governorateId = 0;
  int _areaId = 0;
  String _searchText = '';

  selectGovernorate({required int id}) {
    _governorateId = id;
    _areaId = 0;
    _getBranches();
    _getAreas(governorateId: id);
  }

  selectArea({required int id}) {
    _areaId = id;
    _getBranches();
  }

  search({required String searchText}) {
    _searchText = searchText;
    _getBranches();
  }

  _getBranches() {
    emit(MedicalCenterBranchesLoadingState());
    DioHelper.getData(
      path: EndPoint.getServiceProviderBranches,
      queryParameters: {
        'HospitalID': medicalCenterId,
        'GovID': _governorateId,
        'CityID': _areaId,
        'Name': _searchText,
      },
    ).then(
      (branches) {
        final branchesList = branches.data as List;
        this.branches = branchesList
            .map((i) => MedicalCenterBranchEntity.fromJson(i))
            .toList();
        emit(MedicalCenterGetBranchesState());
      },
    ).catchError(
      (error) {
        emit(MedicalCenterBranchesErrorState());
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
            governoratesList.map((i) => LookupEntity.fromJson(i)).toList();
        emit(MedicalCenterGetGovernoratesState());
      },
    ).catchError(
      (error) {
        emit(MedicalCenterBranchesErrorState());
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
      emit(MedicalCenterGetAreasState());
    }).catchError(
      (error) {
        emit(MedicalCenterBranchesErrorState());
      },
    );
  }
}
