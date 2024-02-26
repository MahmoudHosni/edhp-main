import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/branches/medical_center_branches_states.dart';
import 'package:edhp/models/medical_center_branch_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalCenterBranchesCubit extends Cubit<MedicalCenterBranchesStates> {
  MedicalCenterBranchesCubit({required int medicalCenterId})
      : super(MedicalCenterBranchesInitialState()) {
    _getBranches(medicalCenterId: medicalCenterId);
  }

  static MedicalCenterBranchesCubit get(context) => BlocProvider.of(context);

  List<MedicalCenterBranchEntity> branches = [];

  _getBranches({required int medicalCenterId}) {
    emit(MedicalCenterBranchesLoadingState());
    DioHelper.getData(
      path: EndPoint.getServiceProviderBranches,
      queryParameters: {
        'id': medicalCenterId,
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
}
