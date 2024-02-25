import 'package:edhp/features/medical_network/nearest_medical_centers/nearest_medical_centers_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearestMedicalCentersCubit extends Cubit<NearestMedicalCentersStates> {
  NearestMedicalCentersCubit() : super(NearestMedicalCentersInitialState());

  static NearestMedicalCentersCubit get(context) => BlocProvider.of(context);
}