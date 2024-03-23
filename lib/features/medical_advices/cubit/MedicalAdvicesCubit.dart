import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/medical_advices/cubit/MedicalAdvicesState.dart';
import 'package:edhp/models/Medical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalAdvicesCubit extends Cubit<MedicalAdvicesState>{
  MedicalAdvicesCubit() : super(MedicalAdvicesInitalState());
  List<MedicalAdvice>? medicalLst = [];

  static MedicalAdvicesCubit get(BuildContext context) => BlocProvider.of(context);

  Future getAdvices()async{
    emit(MedicalAdvicesLoadingState());
    await DioHelper.getData(
      path: EndPoint.getAdvicesData ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      value.data.forEach((element) {
        medicalLst?.add(MedicalAdvice.fromJson(element));
      });
      emit(MedicalAdvicesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MedicalAdvicesErrorState());
    });
  }
}