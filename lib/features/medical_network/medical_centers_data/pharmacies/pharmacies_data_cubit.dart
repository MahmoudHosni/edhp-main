import 'package:edhp/features/medical_network/medical_centers_data/pharmacies/pharmacies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmaciesDataCubit extends Cubit<PharmaciesDataStates> {
  PharmaciesDataCubit() : super(PharmaciesDataInitialState());

  static PharmaciesDataCubit get(context) => BlocProvider.of(context);
}