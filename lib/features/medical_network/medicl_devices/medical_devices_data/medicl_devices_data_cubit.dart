import 'package:edhp/features/medical_network/medicl_devices/medical_devices_data/medicl_devices_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalDevicesDataCubit extends Cubit<MedicalDevicesDataStates> {
  MedicalDevicesDataCubit() : super(MedicalDevicesDataInitialState());

  static MedicalDevicesDataCubit get(context) => BlocProvider.of(context);
}