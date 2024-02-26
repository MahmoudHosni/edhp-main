import 'package:edhp/features/medical_network/hospitals/outpatient_clinics/outpatient_clinics_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutpatientClinicsCubit extends Cubit<OutpatientClinicsStates> {
  OutpatientClinicsCubit() : super(OutpatientClinicsInitialState());

  static OutpatientClinicsCubit get(context) => BlocProvider.of(context);
}