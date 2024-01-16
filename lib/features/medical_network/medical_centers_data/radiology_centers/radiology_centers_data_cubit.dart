import 'package:edhp/features/medical_network/medical_centers_data/radiology_centers/radiology_centers_data_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadiologyCentersDataCubit extends Cubit<RadiologyCentersDataStates> {
  RadiologyCentersDataCubit() : super(RadiologyCentersDataInitialState());

  static RadiologyCentersDataCubit get(context) => BlocProvider.of(context);
}