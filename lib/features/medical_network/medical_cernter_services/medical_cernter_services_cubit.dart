import 'package:bloc/bloc.dart';
import 'package:edhp/features/medical_network/medical_cernter_services/medical_cernter_services_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalCenterServicesCubit extends Cubit<MedicalCenterServicesStates> {
  MedicalCenterServicesCubit() : super(MedicalCenterServicesInitialState());

  static MedicalCenterServicesCubit get(context) => BlocProvider.of(context);
}