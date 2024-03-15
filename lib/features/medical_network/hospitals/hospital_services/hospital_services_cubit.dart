import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/medical_network/hospitals/hospital_services/hospital_services_states.dart';
import 'package:edhp/models/hospital_service_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalServicesCubit extends Cubit<HospitalServicesStates> {
  HospitalServicesCubit({required int hospitalId})
      : super(HospitalServicesInitialState()) {
    _getServices(hospitalId: hospitalId);
  }

  static HospitalServicesCubit get(context) => BlocProvider.of(context);
  List<HospitalServiceEntity> services = [];

  _getServices({required int hospitalId}) {
    emit(HospitalServicesLoadingState());
    DioHelper.getData(
      path: EndPoint.getHospitalServices,
      queryParameters: {
        'MainHospitalID': hospitalId,
      },
    ).then(
      (services) {
        final labsList = services.data as List;
        this.services =
            labsList.map((i) => HospitalServiceEntity.fromJson(i)).toList();
        emit(HospitalServicesGetClinicsState());
      },
    ).catchError(
      (error) {
        emit(HospitalServicesErrorState());
      },
    );
  }
}
