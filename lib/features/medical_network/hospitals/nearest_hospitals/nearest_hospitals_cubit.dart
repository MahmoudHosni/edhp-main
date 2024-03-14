import 'package:edhp/features/medical_network/hospitals/nearest_hospitals/nearest_hospitals_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearestHospitalsCubit extends Cubit<NearestHospitalsStates> {
  NearestHospitalsCubit() : super(NearestHospitalsInitialState());

  static NearestHospitalsCubit get(context) => BlocProvider.of(context);
}