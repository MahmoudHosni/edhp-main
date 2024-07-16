import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/relatives/show/AllRelativesState.dart';
import 'package:edhp/models/RelativeMembership.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllRelativesCubit extends Cubit<AllRelativesState>{

  AllRelativesCubit():super(AllRelativesInitalState());

  static AllRelativesCubit get(BuildContext context) => BlocProvider.of(context);

  Future getRelatives() async{
    emit(AllRelativesInitalState());
    await DioHelper.getData(
      path: EndPoint.getRelatives ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      List<RelativeMembership> relatives = [];
      value.data.forEach((element) {
        print(element);
        relatives.add(RelativeMembership.fromJson(element));
      });
      emit(AllRelativesListState(relatives: relatives));
    }).catchError((error) {
      print(error.toString());
      emit(AllRelativesFailState());
    });
  }
}