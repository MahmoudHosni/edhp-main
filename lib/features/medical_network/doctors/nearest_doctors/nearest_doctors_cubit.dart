import 'package:bloc/bloc.dart';
import 'package:edhp/features/medical_network/doctors/nearest_doctors/nearest_doctors_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NearestDoctorsCubit extends Cubit<NearestDoctorsStates> {
  NearestDoctorsCubit() : super(NearestDoctorsInitialState());

  static NearestDoctorsCubit get(context) => BlocProvider.of(context);
}