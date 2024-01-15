import 'package:bloc/bloc.dart';
import 'package:edhp/features/medical_network/doctors/doctors_specialties/doctors_specialties_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsSpecialtiesCubit extends Cubit<DoctorsSpecialties> {
  DoctorsSpecialtiesCubit() : super(DoctorsSpecialtiesInitialState());

  static DoctorsSpecialties get(context) => BlocProvider.of(context);
}