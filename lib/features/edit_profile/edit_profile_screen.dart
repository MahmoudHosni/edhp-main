import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/edit_profile/cubit/cubit.dart';
import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:edhp/features/home/widgets/MemberShipCard.dart';
import 'package:edhp/features/home/widgets/MemberShipGoldCard.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:edhp/features/settings/widgets/edit_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_paths.dart';
import '../../core/utils/styles/styles.dart';
import 'cubit/state.dart';

class EditProfileScreen extends StatelessWidget {
  MemberShipsResponse? memberShip;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  EditProfileScreen({this.memberShip});

  @override
  Widget build(BuildContext context) {
    nameController.text = CacheHelper.getData(key: 'profile');
    usernameController.text = CacheHelper.getData(key: 'name');
    emailController.text = CacheHelper.getData(key: 'email');
    identityNumberController.text = CacheHelper.getData(key: 'identity');
    phoneNumberController.text = CacheHelper.getData(key: 'name');

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditProfileCubit(),
        ),
      ],
      child: BlocConsumer<EditProfileCubit, EditProfileStates>(
        listener: (context, state) {
          if (state is EditProfileSuccessfullyState) {
            GetProfileCubit.get(context).getProfile();
          }
          if (state is UploadProfileImageSuccessfullyState) {
            final snackBar = SnackBar(
              backgroundColor: AppColors.primaryBlueColor,
              content: const Text('Your Profile Image Has Been Uploaded!'),
              action: SnackBarAction(
                label: 'Ok',
                textColor: AppColors.whiteColor,
                onPressed: () {},
              ),
            );
            GetProfileCubit.get(context).getImageProfile();
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return ViewContainer(
            title: StringsManager.editProfile,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      const EditImage(),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            GetProfileCubit.get(context)
                                .userProfileModel!
                                .profileName
                                .toString(),
                            style: Styles.textStyle16W400,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SvgPicture.asset(
                            AppPaths.editIconSvg,
                            color: AppColors.primaryBlueColor,
                            width: 12,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      (memberShips != null && memberShips.length > 0)
                          ? Center(
                            child: Text(
                                memberShips[0].SubscriptionNumber,
                                style: Styles.textStyle16W400,
                              ),
                          )
                          : SizedBox(),
                      const SizedBox(
                        height: 8,
                      ),
                      (memberShip != null && memberShips.isNotEmpty)
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height:
                                  MediaQuery.of(context).size.height / 3.7,
                              child: ((memberShips[0].MembershipTypeName=="Gold Member")? MemberShipGoldCard(memberShip: memberShips[0], scaler: 1.5, spaceTop: 32,spaceLeft: 1.5,):
                                        MemberShipCard(memberShip: memberShips[0],scaler: 1.5,spaceTop: 32,))


                              )
                          : const SizedBox(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 25,
                      ),
                      const Text(
                        'الإسم',
                        style: Styles.textStyle16W500,
                      ),
                      getContainer(
                        child: DefaultTextFormFieldWithoutLabel(
                          maxLen: 100,
                          error: nameController.text.length == 14 ? '' : "",
                          controller: nameController,
                          onChange: (value) => {nameController.text = value},
                          keyboardType: TextInputType.text,
                          validation: (value) {
                            if (value!.isEmpty) {
                              return 'name must be not empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'اسم المستخدم',
                        style: Styles.textStyle16W500,
                      ),
                      getContainer(
                          child: DefaultTextFormFieldWithoutLabel(
                        maxLen: 100,
                        error: usernameController.text.length == 14 ? '' : "",
                        controller: usernameController,
                        keyboardType: TextInputType.text,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'username must be not empty';
                          }
                          return null;
                        },
                      )),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'الرقم القومي',
                        style: Styles.textStyle16W500,
                      ),
                      getContainer(
                          child: DefaultTextFormFieldWithoutLabel(
                        maxLen: 100,
                        error: identityNumberController.text.length == 14
                            ? ''
                            : "",
                        controller: identityNumberController,
                        isClickable: false,
                        keyboardType: TextInputType.text,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'identity number must be not empty';
                          }
                          return null;
                        },
                      )),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'البريد الالكتروني',
                        style: Styles.textStyle16W500,
                      ),
                      getContainer(
                          child: DefaultTextFormFieldWithoutLabel(
                        maxLen: 100,
                        error: emailController.text.length == 14 ? '' : "",
                        controller: emailController,
                        keyboardType: TextInputType.text,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'email must be not empty';
                          }
                          return null;
                        },
                      )),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'رقم الهاتف',
                        style: Styles.textStyle16W500,
                      ),
                      getContainer(
                          child: DefaultTextFormFieldWithoutLabel(
                        maxLen: 100,
                        error:
                            phoneNumberController.text.length == 14 ? '' : "",
                        controller: phoneNumberController,
                        keyboardType: TextInputType.number,
                        validation: (value) {
                          if (value!.isEmpty) {
                            return 'phone number must be not empty';
                          }
                          return null;
                        },
                      )),
                      const SizedBox(
                        height: 36,
                      ),
                      if (state is EditProfileLoadingState)
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryBlueColor,
                          ),
                        ),
                      if (state is EditProfileLoadingState)
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                      DefaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            EditProfileCubit.get(context)
                                .editProfile(
                              name: nameController.text,
                              username: usernameController.text,
                              mobileNumber: phoneNumberController.text,
                              email: emailController.text,
                              identityNumber: identityNumberController.text,
                            )
                                .then((value) {
                              GetProfileCubit cubit =
                                  GetProfileCubit.get(context);
                              cubit.getProfile();
                              GoRouter.of(context)
                                  .push(AppRouters.kLayoutScreen);
                            });
                          }
                        },
                        text: 'حفظ التغييرات',
                        redius: 10,
                      ),
                      SizedBox(
                        height: 18,
                      )
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

  Container getContainer({required DefaultTextFormFieldWithoutLabel child}) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
      alignment: Alignment.center,
      height: 65,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 0.8,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: child,
    );
  }
}
