import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/EditTextView.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/authantication/sign_up/cubit/cubit.dart';
import 'package:edhp/features/authantication/sign_up/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components/widgets/default_button.dart';
import '../../../../core/utils/app_components/widgets/default_text_button.dart';
import '../../../../core/utils/app_components/widgets/default_text_form_field.dart';
import '../../../../core/utils/app_paths.dart';
import '../../../../core/utils/styles/styles.dart';
import '../login/widgets/or_divider.dart';
import '../login/widgets/row_of_register_apps.dart';
import 'cubit/state.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if(state is SignUpSuccessfullyState){
          GoRouter.of(context).push(AppRouters.kLayoutScreen);
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Align(child: Image.asset(AppPaths.upperLoginPart,fit: BoxFit.scaleDown,width: 350,),alignment: Alignment.topLeft),
                      const SizedBox(height: 12,),
                      Text('إنشاء حساب جديد' , style: Styles.textStyle14W500.copyWith(color: AppColors.primaryBlueColor),textAlign: TextAlign.center,),

                      const SizedBox(height: 20,),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20,5,20,8),
                          child: EditTextView(
                                controller: nameController,
                                keyboardType: TextInputType.name,
                                validation: (value){
                                  if(value!.isEmpty){
                                    return 'Please enter your name to sign up';
                                  }else {
                                    return null;
                                  }
                                },
                                fieldName: 'الاسم',
                                suffixIcon: Icons.person_outline,
                        )),
                      const SizedBox(height: 10,),
                      Padding(
                              padding: const EdgeInsets.fromLTRB(20,5,20,8),
                              child: EditTextView(
                                    controller: phoneNumberController,
                                    keyboardType: TextInputType.number,
                                    validation: (value){
                                      if(value!.isEmpty){
                                        return 'Please enter your mobile number to sign up';
                                      }else {
                                        return null;
                                      }
                                    },
                                    fieldName: 'رقم الهاتف',
                                    suffixIcon: Icons.call_outlined,
                      )),
                      const SizedBox(height: 10,),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20,5,20,8),
                          child: EditTextView(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                validation: (value){
                                  if(value!.isEmpty){
                                    return 'Please enter your email address to sign up';
                                  }else {
                                    return null;
                                  }
                                },
                                fieldName: 'البريد الإلكتروني',
                                suffixIcon: Icons.email_outlined,
                      )),
                      const SizedBox(height: 10,),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(20,5,20,8),
                          child: EditTextView(
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                validation: (value){
                                  if(value!.isEmpty){
                                    return 'Please enter your password to sign up';
                                  }else {
                                    return null;
                                  }
                                },
                                fieldName: 'كلمة السر',
                                suffixIcon: Icons.lock_outline,
                                prefixIcon: SignUpCubit.get(context).suffix,
                                onPressedPrefixIcon: (){
                                  SignUpCubit.get(context).changePasswordVisibility();
                                },
                                obscureText: SignUpCubit.get(context).isPassword,
                      )),
                      const SizedBox(height: 20,),
                      if(state is SignUpLoadingState)
                        const CircularProgressIndicator(color: AppColors.primaryBlueColor),
                      if(state is SignUpLoadingState)
                        const SizedBox(height: 26,),
                      Padding(
                      padding: const EdgeInsets.fromLTRB(20,5,20,8),
                      child: DefaultButton(backgroundColor: AppColors.blue,
                        function: (){
                          if(formKey.currentState!.validate()){
                            SignUpCubit.get(context).signUp(
                                name: nameController.text.trim().toString(),
                                email: emailController.text.trim().toString(),
                                username: phoneNumberController.text.trim().toString(),
                                password: passwordController.text.trim().toString(),
                                mobileNumber: phoneNumberController.text.trim().toString(),
                            );
                          }
                        },
                        text: 'تسجيل',
                        redius: 10,
                      )),
                      const SizedBox(height: 10,),
                      Text('أو سجل الدخول بواسطة',style: Styles.textStyle10W400.copyWith(color: AppColors.secondNew),),
                      const SizedBox(height: 10,),
                      const RowOfRegisterApps(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultTextButton(textColor: AppColors.thirdNew,
                            text: 'تسجيل دخول',
                            function: (){
                              GoRouter.of(context).push(AppRouters.kLoginScreen);
                            },
                          ),
                          Text('لديك حساب فى المنصة ؟' , style: Styles.textStyle12W400.copyWith(color: AppColors.lightGrayColor),),
                        ],
                      ),
                      Container(child: SvgPicture.asset(AppPaths.downLoginPart),width: double.infinity,alignment: Alignment.bottomCenter,),
                    ],
                  ),
                ),
              ),
          ),
        );
      },
),
);
  }
}
