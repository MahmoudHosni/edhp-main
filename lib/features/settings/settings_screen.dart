import 'package:cached_network_image/cached_network_image.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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
          return ViewContainer(title: StringsManager.settings,body: Container(height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: 95,
                          height: 95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: CachedNetworkImage(
                            imageUrl: '$baseUrl${EndPoint.imgPath}?referenceTypeId=1&referenceId=${CacheHelper.getData(key: 'id')}',
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                            placeholder: (context, url) =>  Image.asset(AppPaths.profileImage, fit: BoxFit.cover,),
                            errorWidget: (context, url, error) => Image.asset(AppPaths.profileImage, fit: BoxFit.cover,)),
                        ),
                        Container(padding: EdgeInsets.fromLTRB(9, 9, 0, 0),
                          width: 45,
                          height: 45,
                          child: SvgPicture.asset(AppPaths.editIconSvg,),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(GetProfileCubit.get(context).userProfileModel!.profileName.toString() , style: Styles.textStyle14W400.copyWith(color: AppColors.secondNew),),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(GetProfileCubit.get(context).userProfileModel!.userName.toString(), style: Styles.textStyle13W400.copyWith(color: AppColors.unselectedColor),),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 36,
                  ),
                  InkWell(
                    onTap: (){
                      GoRouter.of(context).push(AppRouters.kEditProfileScreen);
                    },
                    child: Container(margin: const EdgeInsets.fromLTRB(0,0,0,8),width: 260,padding: const EdgeInsets.all(8),
                      height: 54,alignment: Alignment.center,decoration: BoxDecoration(color: AppColors.whiteLightNew,border: Border.all(color: AppColors.cardBorderNew,width: 1),borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset('assets/icons/previous.svg'),
                          const Spacer(),
                          const Text('تعديل الملف الشخصي' , style: Styles.textStyle12W400,),
                          const SizedBox(
                            width: 10,
                          ),
                          SvgPicture.asset(AppPaths.personIconSvg),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 50,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text('الإشعارات والتنبيهات' , style: Styles.textStyle14W500.copyWith(color: AppColors.secondNew),),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(margin: const EdgeInsets.fromLTRB(0,0,0,8),width: double.infinity,padding: const EdgeInsets.all(8),
                    height: 52,alignment: Alignment.center,decoration: BoxDecoration(color: AppColors.whiteLightNew,border: Border.all(color: AppColors.cardBorderNew,width: 1),borderRadius: BorderRadius.all(Radius.circular(25))),
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
                          Text('تفعيل الإشعارات والتنبيهات' , style: Styles.textStyle12W400.copyWith(color: AppColors.blackColor),),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 40,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text('المؤشرات الحيوية' , style: Styles.textStyle14W500.copyWith(color: AppColors.secondNew),),
                  ),
                  SizedBox(
                    height:  8,
                  ),
                  Container(margin: const EdgeInsets.fromLTRB(0,0,0,8),width: double.infinity,padding: const EdgeInsets.all(8),
                    height: 52,alignment: Alignment.center,decoration: BoxDecoration(color: AppColors.whiteLightNew,border: Border.all(color: AppColors.cardBorderNew,width: 1),borderRadius: BorderRadius.all(Radius.circular(25))),
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
                          const Text('تفعيل بصمة اللإصبع عند الدخول' , style: Styles.textStyle12W400,),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text('اللغة المفضلة' , style: Styles.textStyle14W500.copyWith(color: AppColors.secondNew),),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 220,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(width: 95,padding: EdgeInsets.all(5),alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.whiteLightNew,borderRadius: BorderRadius.only(topLeft: Radius.circular(32),bottomLeft:Radius.circular(32) )),
                            child:  Text('English' , style: Styles.textStyle12W400.copyWith(color: AppColors.secondNew),)),
                        SizedBox(width: 1,),
                        Container(width: 95,padding: EdgeInsets.all(5),alignment: Alignment.center,
                            decoration: BoxDecoration(color: AppColors.secondNew,borderRadius: BorderRadius.only(topRight: Radius.circular(32),bottomRight:Radius.circular(32) )),
                            child:  Text('العربية' , style: Styles.textStyle12W400.copyWith(color: AppColors.whiteLightNew),)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 35,
                  ),
                ],
              ),
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
