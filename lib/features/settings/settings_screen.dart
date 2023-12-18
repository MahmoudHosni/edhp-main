import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/network/end_point.dart';
import '../layout/cubit/cubit.dart';
import '../layout/cubit/states.dart';
import '../profile/cubit/get_profile_cubit.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    bool isLoaded = false;

    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if(state is GetProfileSuccessfullyState){
          isLoaded = true;
        }
      },
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        if(!isLoaded || state is !GetProfileSuccessfullyState) {
          return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Image.file(GetProfileCubit.get(context).profileImage!,
                          fit: BoxFit.fill,),
                      ),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.primaryBlueColor,
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppPaths.editIconSvg,),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(GetProfileCubit.get(context).userProfileModel!.profileName.toString() , style: Styles.textStyle16W400,),
                    const SizedBox(
                      width: 5,
                    ),
                    SvgPicture.asset(AppPaths.editIconSvg , color: AppColors.primaryBlueColor, width: 12,),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Text(GetProfileCubit.get(context).userProfileModel!.userName.toString(), style: Styles.textStyle16W400,),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                InkWell(
                  onTap: (){
                    GoRouter.of(context).push(AppRouters.kEditProfileScreen);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.arrow_back_ios),
                        const Spacer(),
                        const Text('تعديل الملف الشخصي' , style: Styles.textStyle20W500,),
                        const SizedBox(
                          width: 20,
                        ),
                        SvgPicture.asset(AppPaths.personIconSvg),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text('الإشعارات والتنبيهات' , style: Styles.textStyle20W500,),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: AppColors.boxesColor,
                        blurRadius: 5
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Switch(
                          value: cubit.switchOfNotification,
                          onChanged: (bool value){
                            cubit.changeSwitchOfNotification(value);
                          },
                          activeColor: AppColors.whiteColor,
                          activeTrackColor: AppColors.primaryBlueColor,
                        ),
                        const Spacer(),
                        const Text('تفعيل الإشعارات والتنبيهات' , style: Styles.textStyle16W400,),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text('المؤشرات الحيوية' , style: Styles.textStyle20W500,),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                            color: AppColors.boxesColor,
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Switch(
                          value: cubit.switchOfFingerPrint,
                          onChanged: (bool value){
                            cubit.changeSwitchOfFingerPrint(value);
                          },
                          activeColor: AppColors.whiteColor,
                          activeTrackColor: AppColors.primaryBlueColor,
                        ),
                        const Spacer(),
                        const Text('تفعيل بصمة اللإصبع عند الدخول' , style: Styles.textStyle16W400,),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text('اللغة المفضلة' , style: Styles.textStyle20W500,),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
                Container(
                  width: MediaQuery.of(context).size.width/1.48,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color: cubit.isArabic ? AppColors.whiteColor : AppColors.primaryBlueColor,
                      boxShadow: const [
                        BoxShadow(
                            color: AppColors.boxesColor,
                            blurRadius: 5
                        )
                      ]
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          cubit.changeLanguage(true);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 46,
                          decoration: BoxDecoration(
                            color: cubit.isArabic? AppColors.primaryBlueColor : AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text('العربية' , style: Styles.textStyle16W500.copyWith(color: cubit.isArabic ? AppColors.whiteColor : AppColors.blackColor),)),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          cubit.changeLanguage(false);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width/3,
                          height: 46,
                          decoration: BoxDecoration(
                            color: cubit.isArabic? AppColors.whiteColor : AppColors.primaryBlueColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text('الإنجليزية' , style: Styles.textStyle16W500.copyWith(color: cubit.isArabic ? AppColors.blackColor : AppColors.whiteColor),)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 35,
                ),
              ],
            ),
          ),
        );
        } else {
          return Scaffold();
        }
      },
);
  }
}
