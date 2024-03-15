import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/hospitals/outpatient_clinics/outpatient_clinics_states.dart';
import 'package:edhp/models/hospital_clinic_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutpatientClinicsCubit extends Cubit<OutpatientClinicsStates> {
  OutpatientClinicsCubit({required int hospitalId})
      : super(OutpatientClinicsInitialState()) {
    _getClinics(hospitalId: hospitalId);
  }

  static OutpatientClinicsCubit get(context) => BlocProvider.of(context);
  List<HospitalClinicEntity> clinics = [];

  _getClinics({required int hospitalId}) {
    emit(OutpatientClinicsLoadingState());
    DioHelper.getData(
      path: EndPoint.getHospitalClinics,
      queryParameters: {
        'MainHospitalID': hospitalId,
      },
    ).then(
      (clinics) {
        final labsList = clinics.data as List;
        this.clinics =
            labsList.map((i) => HospitalClinicEntity.fromJson(i)).toList();
        emit(OutpatientClinicsGetClinicsState());
      },
    ).catchError(
      (error) {

        emit(OutpatientClinicsErrorState());
      },
    );
  }
}
