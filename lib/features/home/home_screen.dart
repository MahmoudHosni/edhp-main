import 'package:cached_network_image/cached_network_image.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/call_center/call_center_screen.dart';
import 'package:edhp/features/drawer/drawer_components.dart';
import 'package:edhp/features/home/widgets/medical_file_container_items.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/features/layout/cubit/states.dart';
import 'package:edhp/features/medical_file/medical_file_screen.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:edhp/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..loadData(context),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
          listener: (context, state) {           },
          builder: (context, state) {
            // if(state is GetProfileSuccessfullyState || state is GetProfileImageSuccessfullyState || state is ChangeAdsImage ) {
              return Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: AppColors.blackColor),
                backgroundColor: AppColors.whiteColor,
                elevation: 0,
                centerTitle: true,
                title: SvgPicture.asset(AppPaths.logoPath , width: 90,),titleSpacing: 0,
                leading: IconButton(
                  onPressed: (){

                  },
                  icon: SvgPicture.asset(AppPaths.notificationIconSvg),
                ),
              ),
              body:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),child:SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 28,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5,
                        child: Stack(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAlias,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: CachedNetworkImage(
                                  imageUrl:LayoutCubit.get(context).adsImage.length>0 ? LayoutCubit.get(context).adsImage[LayoutCubit.get(context).index!] :EndPoint.staticAds,
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) =>  Image.network( EndPoint.staticAds, fit: BoxFit.cover,),
                                  errorWidget: (context, url, error) => Image.network( EndPoint.staticAds, fit: BoxFit.cover,))
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                onPressed: (){
                                  LayoutCubit.get(context).changeAdsImageRightIcon();
                                },
                                icon: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.whiteColor, size: 25,
                                    shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 8.0)]),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: IconButton(
                                onPressed: (){
                                  LayoutCubit.get(context).changeAdsImageRightIcon();
                                },
                                icon: const Icon(Icons.arrow_back_ios, color: AppColors.whiteColor, size: 25,
                                    shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 8.0)]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(StringsManager.categories , style: Styles.textStyle16W500,)
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){},
                            child: Image.asset(AppPaths.product01,width: 96,height: 88),
                          ),
                          InkWell(
                            child: Image.asset(AppPaths.product02,width: 96,height: 88),
                            onTap: (){GoRouter.of(context).push(AppRouters.kMemberShipTypes);},
                          ),
                          InkWell(
                            child: Image.asset(AppPaths.product03,width: 96,height: 88),
                            onTap: (){GoRouter.of(context).push(AppRouters.kMedicalAdvices);},
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset(AppPaths.medicalProfileFileIconSvg,),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(StringsManager.yourHealthProfile , style: Styles.textStyle16W500,),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.shadowColor,
                                  blurRadius: 8
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 8,),
                              const Text('رقم الملف : 123456' , style: Styles.textStyle16W500,),
                              const SizedBox(
                                height: 15,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  MedicalFileContainerItem(mainText: 'الفصيلة', value: 'A+', iconPath: AppPaths.bloodTypeIcon),
                                  MedicalFileContainerItem(mainText: 'الجنس', value: 'ذكر', iconPath: AppPaths.genderIcon),
                                  MedicalFileContainerItem(mainText: 'العمر', value: '25', iconPath: AppPaths.ageIcon),
                                ],
                              ),
                              TextButton(
                                onPressed: (){

                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.arrow_back_ios , color: AppColors.primaryBlueColor, size: 15,),
                                    Text(
                                      'المزيد',
                                      style: TextStyle(
                                          color: AppColors.primaryBlueColor,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13,
                                          fontFamily: 'Tajawal'
                                      ),
                                    ),
                                  ],
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 8,)
                    ],
                  ),
              )),
              endDrawer: Drawer(
                child: Column(
                  children: [
                    DrawerAppHeader(
                      image: AppPaths.profileImage,
                      name: CacheHelper.getData(key: 'profile'),// GetProfileCubit.get(context).userProfileModel!.profileName.toString(),
                      username: CacheHelper.getData(key: 'name'),// GetProfileCubit.get(context).userProfileModel!.userName.toString(),
                    ),
                    const DrawerAppList(),
                    const SizedBox(height: 8,),
                    const DrawerAppFooter()
                  ],
                ),
              ),
            );
            }
            // else {
            //   return const Scaffold(
            //     body: Center(
            //       child: CircularProgressIndicator(color: AppColors.primaryBlueColor,),
            //     ),
            //   );
            // }
          // },
        ),
    );
  }
}