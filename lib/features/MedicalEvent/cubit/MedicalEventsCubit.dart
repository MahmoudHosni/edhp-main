import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventStates.dart';
import 'package:edhp/models/MedicalEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalEventsCubit extends Cubit<MedicalEventStates>{
  MedicalEventsCubit() : super(LoadingMedicalEvents());

  static MedicalEventsCubit get(BuildContext context) => BlocProvider.of(context);

  Future getEvents()async{
    emit(LoadingMedicalEvents());
    await DioHelper.getData(
      path: EndPoint.GetMedicalEvents ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      List<MedicalEvent> medicalEvents = [];
      value.data.forEach((element) {
        medicalEvents?.add(MedicalEvent.fromJson(element));
      });
      emit(ShowMedicalEvents(medicalEvents: medicalEvents));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorMedicalEvents());
    });
  }
}