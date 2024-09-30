import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/settings/reset_password/cubit/ResetPasswordCubit.dart';
import 'package:edhp/features/settings/reset_password/cubit/ResetPasswordStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_components/widgets/default_text_form_field.dart';
import '../../../../core/utils/styles/styles.dart';


class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
        listener: (context, state) {
      if(state is ResetInitialState || state is ResetLoadingState){
        EasyLoading.show(status: StringsManager.please_wait);
      }else if(state is ResetDoneSuccessfully){
        EasyLoading.dismiss();
        ShowToast.showToast("تم تغيير كلمة السر بنجاح برجاء تسجيل الدخول مرة اخرى");
        CacheHelper.removeData(key: Token);
        while(GoRouter.of(context).canPop()){
          GoRouter.of(context).pop();
        }
        GoRouter.of(context).push(AppRouters.kLoginScreen, );
      }else if(state is ResetErrorOccured){
        EasyLoading.dismiss();
        ShowToast.showToast(state.error);
      }
    },
    builder: (context, state) {
        ResetPasswordCubit cubit = ResetPasswordCubit.get(context);
        return ViewContainer(title: 'إعادة تعيين كلمة السر', body: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                     Container(alignment: Alignment.centerRight, child: Text('ادخل كلمة السر القديمة' , style: Styles.textStyle15W500.copyWith(color: const Color(0xFF333333)), textAlign: TextAlign.start,)),
                    const SizedBox(height: 8,),
                    DefaultTextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      validation: (value){
                        if (value!.isEmpty) {
                          return 'Password must be not empty';
                        }
                        return null;
                      },
                      fieldName: 'كلمة السر القديمة',
                      suffixIcon: cubit.suffix,
                      onPressedSuffixIcon: (){
                        cubit.changePasswordVisibility();
                      },obscureText: cubit.isPassword,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Container(alignment: Alignment.centerRight, child: Text('ادخل كلمة السر الجديدة' , style: Styles.textStyle15W500.copyWith(color: const Color(0xFF333333)), textAlign: TextAlign.start,)),
                    const SizedBox(height: 8,),
                    DefaultTextFormField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.text,
                      validation: (value){
                        if (value!.isEmpty) {
                          return 'New Password must be not empty';
                        }
                        return null;
                      },
                      fieldName: ' كلمة السر الجديدة',
                      suffixIcon: cubit.suffixNew,
                      onPressedSuffixIcon : (){
                        cubit.changePasswordNewVisibility();
                      },obscureText: cubit.isPasswordNew,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    DefaultButton(
                      function: (){
                        cubit.resetPassword(oldPassword: passwordController.text.trim().toString(), newPassword: confirmPasswordController.text.trim().toString());
                      },
                      text: 'تعيين',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));});
  }
}
