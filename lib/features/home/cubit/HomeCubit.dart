import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/home/cubit/HomeState.dart';
import 'package:edhp/models/Advertisement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState>{
  List<Advertisement> advertisements = [];
  HomeCubit() : super(HomeStateLoading());

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future getAdvertisements(BuildContext context) async {
    emit(HomeStateLoading());
    await DioHelper.getData(
      path: EndPoint.getAdvertisements ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      value.data.forEach((element) {
        advertisements?.add(Advertisement.fromJson(element));
      });
      emit(HomeStateLoadSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(HomeStateLoadError());
    });
  }
}