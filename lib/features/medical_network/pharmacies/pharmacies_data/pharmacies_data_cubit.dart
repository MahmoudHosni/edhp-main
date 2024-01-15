import 'package:bloc/bloc.dart';
import 'package:edhp/features/medical_network/pharmacies/pharmacies_data/pharmacies_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PharmaciesDataCubit extends Cubit<PharmaciesDataStates> {
  PharmaciesDataCubit() : super(PharmaciesDataInitialState());

  static PharmaciesDataCubit get(context) => BlocProvider.of(context);
}