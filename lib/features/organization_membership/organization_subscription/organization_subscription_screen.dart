import 'package:edhp/features/organization_membership/organization_subscription/cubit/states.dart';
import 'package:edhp/features/organization_membership/select_the_company/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_components/widgets/default_button.dart';
import '../../../../core/utils/app_components/widgets/default_text_form_field.dart';
import '../../../../core/utils/app_paths.dart';
import '../../../../core/utils/app_routers.dart';
import '../../../../core/utils/styles/styles.dart';
import 'cubit/cubit.dart';


class OrganizationSubscriptionScreen extends StatelessWidget {
  OrganizationSubscriptionScreen({super.key});

  TextEditingController identityNumberController = TextEditingController();
  TextEditingController organizationMembershipNumber = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrganizationSubscriptionCubit(),
      child: BlocConsumer<OrganizationSubscriptionCubit, OrganizationSubscriptionStates>(
          listener: (context, state) {
            if(state is OrganizationSubscriptionSuccessfullyState){
              GoRouter.of(context).pushReplacement(AppRouters.kLayoutScreen);
            }
          },
          builder: (context, state) {
            OrganizationSubscriptionCubit cubit = OrganizationSubscriptionCubit.get(context);
            CompanyItemCubit companyItemCubit = CompanyItemCubit.get(context);
            identityNumberController.text = companyItemCubit.nationalId.toString();
            organizationMembershipNumber.text = companyItemCubit.membershipNumber.toString();
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
                            height: 50,
                          ),
                          Center(
                            child: SvgPicture.asset(AppPaths.logoPath),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'تسجيل الاشتراك', style: Styles.textStyle32W500,),
                          // Text('سجل دخول للدخول لحسابك',
                          //   style: Styles.textStyle16W400.copyWith(
                          //       color: const Color(0xFF333333)),),
                          const SizedBox(height: 30,),
                          DefaultTextFormField(
                            controller: identityNumberController,
                            keyboardType: TextInputType.text,
                            validation: (value) {},
                            isClickable: false,
                            fieldName: 'الرقم القومي',
                            suffixIcon: Icons.perm_identity,
                          ),
                          const SizedBox(height: 15,),
                          DefaultTextFormField(
                            controller: organizationMembershipNumber,
                            keyboardType: TextInputType.text,
                            validation: (value) {},
                            isClickable: false,
                            fieldName: 'رقم النادي',
                            suffixIcon: Icons.file_copy_outlined,
                          ),
                          const SizedBox(height: 15,),
                          DefaultTextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.text,
                            validation: (value) {
                              if(value!.isEmpty) {
                                return 'Phone Number must be not empty';
                              }
                              return null;
                            },
                            fieldName: 'رقم الهاتف',
                            suffixIcon: Icons.call_outlined,
                          ),
                          const SizedBox(height: 15,),
                          DefaultTextFormField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            validation: (value) {
                              if(value!.isEmpty) {
                                return 'Password must be not empty';
                              }
                              return null;
                            },
                            fieldName: 'كلمة السر',
                            suffixIcon: Icons.lock_outline,
                            prefixIcon: cubit.suffix,
                            onPressedPrefixIcon: () {
                              cubit.changePasswordVisibility();
                            },
                            obscureText: cubit.isPassword,
                          ),
                          const SizedBox(height: 26,),
                          if(state is OrganizationSubscriptionLoadingState)
                            const CircularProgressIndicator(color: AppColors.primaryBlueColor,),
                          if(state is OrganizationSubscriptionLoadingState)
                            const SizedBox(height: 26,),
                          DefaultButton(
                            function: () {
                              if(formKey.currentState!.validate()){
                                cubit.organizationSubscription(
                                  username: phoneNumberController.text.trim(),
                                  password: passwordController.text.trim(),
                                  identityNumber: identityNumberController.text.trim(),
                                  organizationMembershipNumber: int.parse(organizationMembershipNumber.text.trim().toString()),
                                );
                              }
                            },
                            text: 'تسجيل الاشتراك',
                            redius: 10,
                          ),
                          const SizedBox(height: 20,),
                          if(state is OrganizationSubscriptionLoadingState)
                            const SizedBox(
                              height: 30,
                            ),
                          if(state is OrganizationSubscriptionLoadingState)
                            const CircularProgressIndicator(color: AppColors.primaryBlueColor,)
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
