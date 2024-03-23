import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/cache_helper.dart';
import 'states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) =>BlocProvider.of(context);


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  bool rememberMe = false;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibility());
  }

  void changeRememberMeState(){
    rememberMe = !rememberMe;
    emit(LoginChangeRememberMeState());
  }

  Future login({
    required String username ,
    required String password,
  }) async{
    emit(LoginLoadingState());
    print('Username: $username, Password: $password');
    return await DioHelper.postData(
      path: EndPoint.login,
      data: {
        "userName" : username,//'01001562790',//
        "password" : password
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print('############Login Model###############');
      print(loginModel);
      print('token : ${value.data['ResultObject']['AccessToken']}');
      token = value.data['ResultObject']['AccessToken'];

      print(token);
      CacheHelper.saveData(key: Name, value: loginModel?.resultObject?.userName??'');
      CacheHelper.saveData(key: Profile, value: loginModel?.resultObject?.profileName);
      CacheHelper.saveData(key: 'id', value: loginModel?.resultObject?.profileID);
      CacheHelper.saveData(key: Token, value: token);
      emit(LoginSuccessfullyState());
    }).catchError((error) {
      emit(LoginErrorState(error: error.toString()));
      print(error.toString());
    });
  }
}