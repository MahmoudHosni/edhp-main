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

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    bool isLoaded = false;

    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {
        if (state is GetProfileSuccessfullyState) {
          isLoaded = true;
        }
      },
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.get(context);
        if (!isLoaded || state is! GetProfileSuccessfullyState) {
          return ViewContainer(
            title: StringsManager.settings,
            showBack: false,
            body: Container(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: Image.network(
                              '$baseUrl${EndPoint.imgPath}?referenceTypeId=1&referenceId=${CacheHelper.getData(key: 'id')}&${DateTime.now().millisecondsSinceEpoch.toString()}',
                              fit: BoxFit.cover,
                              width: 80,
                              height: 80,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
                                  ),
                                );
                              },
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(9, 9, 0, 0),
                            width: 45,
                            height: 45,
                            child: SvgPicture.asset(
                              AppPaths.editIconSvg,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Text(CacheHelper.getData(key: 'profile'),
                        style: Styles.textStyle14W400
                            .copyWith(color: AppColors.secondNew),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    (memberShips != null && memberShips.length > 0)
                        ? Center(
                            child: Text(
                              memberShips[0].SubscriptionNumber,
                              style: Styles.textStyle13W400
                                  .copyWith(color: AppColors.unselectedColor),
                            ),
                          )
                        : SizedBox(),
                    const SizedBox(
                      height: 28,
                    ),
                    InkWell(
                      onTap: () {
                        print("Memberships :::: ${memberShips.length}");
                        GoRouter.of(context).push(AppRouters.kEditProfileScreen,
                            extra:
                                memberShips.length > 0 ? memberShips[0] : null);
                      },
                      child: Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 52),
                        child: Container(
                            padding: const EdgeInsetsDirectional.symmetric(
                                horizontal: 12),
                            height: 52,
                            decoration: BoxDecoration(
                                color: AppColors.whiteLightNew,
                                border: Border.all(
                                    color: AppColors.cardBorderNew, width: 1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(26))),
                            child: Row(
                              children: [
                                SvgPicture.asset(AppPaths.personIconSvg),
                                const SizedBox(width: 8),
                                const Text(
                                  'تعديل الملف الشخصي',
                                  style: Styles.textStyle15W500,
                                ),
                                const Spacer(),
                                SvgPicture.asset('assets/icons/previous.svg'),
                              ],
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 52),
                      child: Container(
                          padding: const EdgeInsetsDirectional.symmetric(
                              horizontal: 12),
                          height: 52,
                          decoration: BoxDecoration(
                              color: AppColors.whiteLightNew,
                              border: Border.all(
                                  color: AppColors.cardBorderNew, width: 1),
                              borderRadius: const BorderRadius.all(
                                  Radius.circular(26))),
                          child: Row(
                            children: [
                              SvgPicture.asset(AppPaths.personIconSvg),
                              const SizedBox(width: 8),
                              const Text(
                                'تغيير كلمة السر',
                                style: Styles.textStyle14W400,
                              ),
                              const Spacer(),
                              SvgPicture.asset('assets/icons/previous.svg'),
                            ],
                          )),
                    ),onTap: () {
                      GoRouter.of(context).push(AppRouters.kResetPasswordScreen);
                    },),

                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      'الإشعارات والتنبيهات',
                      style: Styles.textStyle14W500
                          .copyWith(color: AppColors.secondNew),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 12),
                      height: 52,
                      decoration: BoxDecoration(
                          color: AppColors.whiteLightNew,
                          border: Border.all(
                              color: AppColors.cardBorderNew, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(26))),
                      child: Row(
                        children: [
                          Text(
                            'تفعيل الإشعارات والتنبيهات',
                            style: Styles.textStyle12W400
                                .copyWith(color: AppColors.blackColor),
                          ),
                          const Spacer(),
                          Switch(
                            value: cubit.switchOfNotification,
                            onChanged: (bool value) {
                              cubit.changeSwitchOfNotification(value);
                            },
                            activeColor: AppColors.whiteColor,
                            activeTrackColor: AppColors.primaryBlueColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Text(
                      'المؤشرات الحيوية',
                      style: Styles.textStyle14W500
                          .copyWith(color: AppColors.secondNew),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 12),
                      height: 52,
                      decoration: BoxDecoration(
                          color: AppColors.whiteLightNew,
                          border: Border.all(
                              color: AppColors.cardBorderNew, width: 1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(26))),
                      child: Row(
                        children: [
                          const Text(
                            'تفعيل بصمة اللإصبع عند الدخول',
                            style: Styles.textStyle12W400,
                          ),
                          const Spacer(),
                          Switch(
                            value: cubit.switchOfFingerPrint,
                            onChanged: (bool value) {
                              cubit.changeSwitchOfFingerPrint(value);
                            },
                            activeColor: AppColors.whiteColor,
                            activeTrackColor: AppColors.primaryBlueColor,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),


                    // Text(
                    //   'اللغة المفضلة',
                    //   style: Styles.textStyle14W500
                    //       .copyWith(color: AppColors.secondNew),
                    // ),
                    // const SizedBox(
                    //   height: 12,
                    // ),
                    // Center(
                    //   child: SizedBox(
                    //     width: 220,
                    //     height: 44,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Container(
                    //             width: 95,
                    //             padding: EdgeInsets.all(5),
                    //             alignment: Alignment.center,
                    //             decoration: BoxDecoration(
                    //                 color: AppColors.secondNew,
                    //                 borderRadius: BorderRadius.only(
                    //                     topRight: Radius.circular(32),
                    //                     bottomRight: Radius.circular(32))),
                    //             child: Text(
                    //               'العربية',
                    //               style: Styles.textStyle12W400
                    //                   .copyWith(color: AppColors.whiteLightNew),
                    //             )),
                    //         SizedBox(
                    //           width: 1,
                    //         ),
                    //         Container(
                    //             width: 95,
                    //             padding: EdgeInsets.all(5),
                    //             alignment: Alignment.center,
                    //             decoration: BoxDecoration(
                    //                 color: AppColors.whiteLightNew,
                    //                 borderRadius: BorderRadius.only(
                    //                     topLeft: Radius.circular(32),
                    //                     bottomLeft: Radius.circular(32))),
                    //             child: Text(
                    //               'English',
                    //               style: Styles.textStyle12W400
                    //                   .copyWith(color: AppColors.secondNew),
                    //             )),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
