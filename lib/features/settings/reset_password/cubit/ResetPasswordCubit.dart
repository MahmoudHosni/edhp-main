import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/settings/reset_password/cubit/ResetPasswordStates.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates>{
  bool isPassword = true;
  bool isPasswordNew = true;
  IconData suffix = Icons.visibility_outlined;
  IconData suffixNew = Icons.visibility_outlined;

  ResetPasswordCubit() : super(ResetInitialState());

  static ResetPasswordCubit get(BuildContext context) => BlocProvider.of(context);

  Future resetPassword({required String oldPassword, required String newPassword,}) async{
    emit(ResetLoadingState());
    await DioHelper.postData(
      path: EndPoint.updatePassword,token: CacheHelper.getData(key: Token),
      data: {  "OldPassword": oldPassword, "NewPassword": newPassword },
    ).then((value) {
      print(value.data);
      emit(ResetDoneSuccessfully());
    }).catchError((error){
      print(error.toString());
      emit(ResetErrorOccured(error: error.toString()));
    });
  }

  void changePasswordNewVisibility() {
    isPasswordNew = !isPasswordNew;
    suffixNew = isPasswordNew ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ResetChangePasswordVisibility(icon: suffixNew));
  }

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ResetChangePasswordVisibility(icon: suffix));
  }
}