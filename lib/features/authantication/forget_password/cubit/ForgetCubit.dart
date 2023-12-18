import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/authantication/forget_password/cubit/ForgetStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetCubit extends Cubit<ForgetStates> {
  ForgetCubit() : super(ForgetInitialState());

  static ForgetCubit get(BuildContext context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ForgetChangePasswordVisibility());
  }

  Future signUp({required String oldPassword, required String newPassword,}) async{
    emit(ForgetLoadingState());
    await DioHelper.postData(
    path: EndPoint.updatePassword,
    data: {  "OldPassword": oldPassword, "NewPassword": newPassword },
  ).then((value) {
      print(value.data['ResultObject']['AccessToken']);

      emit(ForgetSuccessfullyState());
    }).catchError((error){
      print(error.toString());
      emit(ForgetErrorState());
    });
  }
}
/*
"ID": 0,
    "ResultType": 1,
    "Message": "",
    "IsSuccess": true,
    "IsFailed": false
 */