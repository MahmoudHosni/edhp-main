import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/network/cache_helper.dart';
import 'states.dart';

class OrganizationSubscriptionCubit extends Cubit<OrganizationSubscriptionStates> {
  OrganizationSubscriptionCubit() : super(OrganizationSubscriptionInitialState());

  static OrganizationSubscriptionCubit get(BuildContext context) =>BlocProvider.of(context);


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  bool rememberMe = false;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(OrganizationSubscriptionChangePasswordVisibility());
  }

  Future organizationSubscription({
    required String username ,
    required String password,
    required int organizationMembershipNumber,
    required String identityNumber,
  }) async{
    emit(OrganizationSubscriptionLoadingState());
    print('Username: $username, Password: $password');
    return await DioHelper.postData(
      path: EndPoint.organizationMemberSubscription,
      data: {
        "OrganizationMembershipNumber" : organizationMembershipNumber,
        "IdentityNumber" : identityNumber,
        "userName" : username,
        "password" : password
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print('############Model###############');
      print(loginModel);
      print('token : ${value.data['ResultObject']['AccessToken']}');
      token = value.data['ResultObject']['AccessToken'];
      print(token);
      CacheHelper.saveData(key: 'token', value: token);
      emit(OrganizationSubscriptionSuccessfullyState());
    }).catchError((error) {
      emit(OrganizationSubscriptionErrorState(error: error.toString()));
      print(error.toString());
    });
  }
}