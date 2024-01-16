import 'package:edhp/features/medical_network/medical_centers_data/labs/labs_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LabsDataCubit extends Cubit<LabsDataStates> {
  LabsDataCubit() : super(LabsDataInitialStates());

  static LabsDataCubit get(context) => BlocProvider.of(context);
}