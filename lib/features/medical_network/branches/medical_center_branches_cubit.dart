import 'package:bloc/bloc.dart';
import 'package:edhp/features/medical_network/branches/medical_center_branches_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalCenterBranchesCubit extends Cubit<MedicalCenterBranchesStates> {
  MedicalCenterBranchesCubit() : super(MedicalCenterBranchesInitialState());

  static MedicalCenterBranchesCubit get(context) => BlocProvider.of(context);
}