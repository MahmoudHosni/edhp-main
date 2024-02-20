import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/EditTextView.dart';
import 'package:edhp/features/authantication/login/widgets/LoginFacebookButton.dart';
import 'package:edhp/features/authantication/login/widgets/clickable_register_app_container_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components/widgets/default_button.dart';
import '../../../../core/utils/app_components/widgets/default_text_button.dart';
import '../../../../core/utils/app_components/widgets/default_text_form_field.dart';
import '../../../../core/utils/app_paths.dart';
import '../../../../core/utils/app_routers.dart';
import '../../../../core/utils/styles/styles.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'widgets/remember_me_row.dart';
import 'widgets/row_of_register_apps.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessfullyState){
            GoRouter.of(context).pushReplacement(AppRouters.kLayoutScreen);
          }else if(state is LoginErrorState){
            final snackBar = SnackBar(
              backgroundColor: AppColors.primaryBlueColor,
              content: const Text('The username or password is incorrect'),
              action: SnackBarAction(
                label: 'Ok',
                textColor: AppColors.whiteColor,
                onPressed: () {
                },
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return SafeArea(
            child: Scaffold(backgroundColor: AppColors.whiteColor,
              body: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Align(child: Image.asset(AppPaths.upperLoginPart,fit: BoxFit.scaleDown,width: 350,),alignment: Alignment.topLeft),
                        const SizedBox(height: 12,),
                        Text(StringsManager.loginToAccount, style: Styles.textStyle14W500.copyWith(color: AppColors.primaryBlueColor),textAlign: TextAlign.center,),
                        const SizedBox(height: 12,),

                        Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 8),
                          child: IntlPhoneField(
                            decoration: InputDecoration(
                              labelText: StringsManager.phoneNumber,
                              fillColor: Colors.white,
                            ),
                            initialCountryCode: 'EG',
                            pickerDialogStyle:PickerDialogStyle(backgroundColor: Colors.white,
                                countryCodeStyle: TextStyle(color: Colors.blue),
                                countryNameStyle: TextStyle(color: Colors.black)),
                            onChanged: (phone) {
                              phoneNumberController.text = phone.completeNumber;
                            },
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(20,5,20,8),
                        //   child: EditTextView(
                        //     controller: phoneNumberController,
                        //     keyboardType: TextInputType.text,
                        //     validation: (value) {
                        //       if(value!.isEmpty) {
                        //         return 'Phone Number must be not empty';
                        //       }
                        //       return null;
                        //     },
                        //     fieldName: StringsManager.phoneNumber,
                        //     suffixIcon: Icons.call_outlined,
                        //   ),
                        // ),

                        const SizedBox(height: 12,),

                        Padding(
                            padding: const EdgeInsets.fromLTRB(20,5,20,8),
                            child: EditTextView(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          validation: (value) {
                            if(value!.isEmpty) {
                              return 'Password must be not empty';
                            }
                            return null;
                          },
                          fieldName: StringsManager.password,
                          suffixIcon: Icons.lock_outline,
                          prefixIcon: cubit.suffix,
                          onPressedPrefixIcon: () {
                            cubit.changePasswordVisibility();
                          },
                          obscureText: cubit.isPassword,
                        )),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(20,5,20,8),
                            child: const RememberMeRow()),
                        const SizedBox(height: 10,),
                        if(state is LoginLoadingState)
                          const CircularProgressIndicator(color: AppColors.primaryBlueColor,),
                        if(state is LoginLoadingState)
                          const SizedBox(height: 26,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,5,20,8),
                          child: DefaultButton(backgroundColor: AppColors.blue,
                            function: () {
                              if(formKey.currentState!.validate()){
                                cubit.login(
                                  username: phoneNumberController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }
                            },
                            text: StringsManager.enterApp,
                            redius: 32,
                        )),
                        const SizedBox(height: 10,),
                        // Text('أو سجل الدخول بواسطة',style: Styles.textStyle10W400.copyWith(color: AppColors.secondNew),),
                        // const SizedBox(height: 10,),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     LoginFacebookBtton(willUsedInLogin: true),
                        //     const SizedBox(width: 15,),
                        //     ClickableRegisterAppContainerItem(appLogoPath: AppPaths.googleLogoPath),
                        //     const SizedBox(width: 15,),
                        //     ClickableRegisterAppContainerItem(appLogoPath: AppPaths.appleLogoPath),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DefaultTextButton(textColor: AppColors.thirdNew,
                              text: StringsManager.registernow,
                              function: () {
                                GoRouter.of(context).push(
                                    AppRouters.kSignUpScreen);
                              },
                            ),
                            Text(StringsManager.notHaveAccount,
                              style: Styles.textStyle13W400.copyWith(
                                  color: AppColors.lightGrayColor),),
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
