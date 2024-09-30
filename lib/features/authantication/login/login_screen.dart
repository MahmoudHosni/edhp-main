import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/EditTextView.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components/widgets/default_button.dart';
import '../../../../core/utils/app_components/widgets/default_text_button.dart';
import '../../../../core/utils/app_paths.dart';
import '../../../../core/utils/app_routers.dart';
import '../../../../core/utils/styles/styles.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'widgets/remember_me_row.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  final _listMemberTypes = ["عضو","تابع"];
  int _tabTextIconIndexSelected = 0;

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
          if (state is LoginSuccessfullyState) {
            GoRouter.of(context).pushReplacement(AppRouters.kLayoutScreen);
          } else if (state is LoginErrorState) {
            final snackBar = SnackBar(
              backgroundColor: AppColors.primaryBlueColor,
              content: const Text('The username or password is incorrect'),
              action: SnackBarAction(
                label: 'Ok',
                textColor: AppColors.whiteColor,
                onPressed: () {},
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(start: 20),
                      child: Image.asset(
                        AppPaths.upperLoginPart,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      StringsManager.loginToAccount,
                      style: Styles.textStyle14W500
                          .copyWith(color: AppColors.primaryBlueColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FlutterToggleTab(
                      width: 50,
                      borderRadius: 15,
                      selectedBackgroundColors: [AppColors.primaryBlueColor],unSelectedBackgroundColors: [AppColors.unselectedColor],
                      selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                      unSelectedTextStyle: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                      labels: _listMemberTypes,
                      selectedIndex: _tabTextIconIndexSelected,
                      selectedLabelIndex: (index) {
                        setState(() {
                          _tabTextIconIndexSelected = index;
                        });
                      },
                    ),

                    Visibility(visible: _tabTextIconIndexSelected==0, child:  Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Directionality(
                        textDirection: TextDirection.ltr,
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            labelText: StringsManager.phoneNumber,
                            labelStyle: Styles.textStyle14W500
                                .copyWith(color: AppColors.lightGrayColor),
                            fillColor: Colors.white,
                          ),
                          initialCountryCode: 'EG',
                          pickerDialogStyle: PickerDialogStyle(
                              backgroundColor: Colors.white,
                              countryCodeStyle: const TextStyle(color: Colors.blue),
                              countryNameStyle: const TextStyle(color: Colors.black)),
                          onChanged: (phone) {
                            phoneNumberController.text = phone.completeNumber;
                          },
                        ),
                      ),
                    )),
                    Visibility(visible: _tabTextIconIndexSelected==1, child:  Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: EditTextView(
                        controller: identityNumberController,
                        keyboardType: TextInputType.phone,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'برجاء ادخال الرقم القومى بصورة صحيحة';
                          }
                          return null;
                        },onSubmit: (value) {
                        if (value == null && value.length != 14) {
                          ShowToast.showToast('برجاء ادخال الرقم القومى بصورة صحيحة');
                          return 'برجاء ادخال الرقم القومى بصورة صحيحة';
                        }
                      },
                        fieldName: 'الرقم القومي',
                        prefixIcon: Icons.account_box,
                      ),
                    )),

                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 20),
                        child: EditTextView(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'Password must be not empty';
                            }
                            return null;
                          },
                          fieldName: StringsManager.password,
                          prefixIcon: Icons.lock_outline,
                          suffixIcon: cubit.suffix,
                          onPressedSuffixIcon: () {
                            cubit.changePasswordVisibility();
                          },
                          obscureText: cubit.isPassword,
                        )),
                    const SizedBox(
                      height: 16,
                    ),
                    const Padding(
                        padding:
                            EdgeInsetsDirectional.symmetric(horizontal: 20),
                        child: RememberMeRow()),
                    const SizedBox(
                      height: 28,
                    ),
                    if (state is LoginLoadingState)
                      const CircularProgressIndicator(
                        color: AppColors.primaryBlueColor,
                      ),
                    if (state is LoginLoadingState)
                      const SizedBox(
                        height: 28,
                      ),
                    Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                        child: DefaultButton(
                          backgroundColor: AppColors.blue,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              if(_tabTextIconIndexSelected==0) {
                                cubit.login(
                                  username: phoneNumberController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }else{
                                cubit.login(
                                  username: identityNumberController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                              }
                            }
                          },
                          text: StringsManager.enterApp,
                          redius: 32,
                        )),
                    const SizedBox(
                      height: 12,
                    ),
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
                        Text(
                          StringsManager.notHaveAccount,
                          style: Styles.textStyle13W400
                              .copyWith(color: AppColors.lightGrayColor),
                        ),
                        DefaultTextButton(
                          textColor: AppColors.thirdNew,
                          text: StringsManager.registernow,
                          function: () {
                            GoRouter.of(context).push(AppRouters.kSignUpScreen);
                          },
                        ),
                      ],
                    ),
                    SvgPicture.asset(AppPaths.downLoginPart),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
