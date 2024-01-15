import 'package:bloc/bloc.dart';
import 'package:edhp/features/medical_network/hospitals/hospitals_data/hospitals_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalsDataCubit extends Cubit<HospitalsDataStates> {
  HospitalsDataCubit() : super(HospitalsDataInitialState());

  static HospitalsDataCubit get(context) => BlocProvider.of(context);
}