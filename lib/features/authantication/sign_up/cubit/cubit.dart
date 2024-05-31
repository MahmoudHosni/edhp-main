import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(BuildContext context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SignUpChangePasswordVisibility());
  }

  Future signUp({
    required String name,
    required String email,
    required String username,
    required String password,
    required String mobileNumber,
  }) async{

    emit(SignUpLoadingState());

    await DioHelper.postData(
      path: EndPoint.register,
      data: {
        "name": name,
        "email": email,
        "userName": username,
        "password": password,
        "MobileNumber": mobileNumber,
      },
    ).then((value) {
      if(value.data["IsSuccess"]) {
        token = value.data['ResultObject']['AccessToken'];
        print("response :::   ${value.data }");
        CacheHelper.saveData(key: Token, value: token);
        CacheHelper.saveData(key: Name, value: mobileNumber);
        CacheHelper.saveData(key: Email, value: email);
        CacheHelper.saveData(key: Profile, value: username);
        print(token);
        emit(SignUpSuccessfullyState());
      }else{
        emit(SignUpErrorState(message: value.data["Message"]));
      }
    }).catchError((error){
      print(error.toString());
      emit(SignUpErrorState(message: error.toString()));
    });
  }

}
