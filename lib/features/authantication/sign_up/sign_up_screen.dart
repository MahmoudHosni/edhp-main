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
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: SvgPicture.asset(AppPaths.logoPath),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text('إنشاء حساب جديد' , style: Styles.textStyle21W500,textAlign: TextAlign.center),
                      Text('قم بملئ البيانات التالية لإنشاء حسابك' , style: Styles.textStyle13W400.copyWith(color: const Color(0xFF333333)),),
                      const SizedBox(height: 20,),
                      DefaultTextFormField(
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
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextFormField(
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
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextFormField(
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
                      ),
                      const SizedBox(height: 10,),
                      DefaultTextFormField(
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
                      ),
                      const SizedBox(height: 20,),
                      if(state is SignUpLoadingState)
                        const CircularProgressIndicator(color: AppColors.primaryBlueColor),
                      if(state is SignUpLoadingState)
                        const SizedBox(height: 26,),
                      DefaultButton(
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
                      ),
                      const SizedBox(height: 15,),
                      const OrDivider(),
                      const SizedBox(height: 15,),
                      const RowOfRegisterApps(),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DefaultTextButton(
                            text: 'دخول',
                            function: (){
                              GoRouter.of(context).push(AppRouters.kLoginScreen);
                            },
                          ),
                          Text('لديك حساب بالفعل ؟' , style: Styles.textStyle14W400.copyWith(color: AppColors.lightGrayColor),),
                        ],
                      ),
                    ],
                  ),
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
