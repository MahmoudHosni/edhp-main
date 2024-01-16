import 'package:edhp/features/medical_network/labs/labs_data/labs_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabsDataCubit extends Cubit<LabsDataStates> {
  LabsDataCubit() : super(LabsDataInitialStates());

  static LabsDataCubit get(context) => BlocProvider.of(context);
}