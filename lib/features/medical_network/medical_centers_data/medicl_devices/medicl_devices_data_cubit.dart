import 'package:edhp/features/medical_network/medical_centers_data/medicl_devices/medicl_devices_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalDevicesDataCubit extends Cubit<MedicalDevicesDataStates> {
  MedicalDevicesDataCubit() : super(MedicalDevicesDataInitialState());

  static MedicalDevicesDataCubit get(context) => BlocProvider.of(context);
}