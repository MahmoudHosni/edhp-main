import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_button.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/styles/styles.dart';

class DrawerAppHeader extends StatelessWidget {
  final String image;
  final String name;
  final String username;

  DrawerAppHeader(
      {super.key,
      required this.image,
      required this.name,
      required this.username});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.5,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(top: 12),
          child: Column(
            children: [
              Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    '$baseUrl${EndPoint.imgPath}?referenceTypeId=1&referenceId=${CacheHelper.getData(key: 'id')}&${DateTime.now().millisecondsSinceEpoch.toString()}',
                    fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  )),
              const SizedBox(
                height: 4,
              ),
              Text(
                name,
                style: Styles.textStyle13W400.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 5,
              ),
              (memberShips != null && memberShips.isNotEmpty)
                  ? Text(
                      memberShips[0].SubscriptionNumber,
                      style:
                          Styles.textStyle11W400.copyWith(color: Colors.white),
                    )
                  : SizedBox(),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: DefaultButton(
                  backgroundColor: Color(0xffF5FAFC),
                  fontSize: 12,
                  textColor: Color(0xff0DBBD6),
                  redius: 20,
                  function: () {
                    GoRouter.of(context).push(AppRouters.kProfileScreen);
                  },
                  text: 'الملف الشخصي',
                  height: 40,
                ),
              ),

              if (memberShips != null && memberShips.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 5),
                  child: DefaultButton(
                    backgroundColor: const Color(0xffF5FAFC),
                    fontSize: 12,
                    textColor: const Color(0xff0DBBD6),
                    redius: 20,
                    function: () {
                      GoRouter.of(context).push(AppRouters.kAllRelativesScreen, );
                    },
                    text: StringsManager.add_relatives.tr(),
                    height: 40,
                  ),
                )
              else const SizedBox(),

            ],
          ),
        ),
      ),
    );
  }
}

class ClickableDrawerItem extends StatelessWidget {
  final bool checkForMembership;
  final String text;
  final String svgIcon;
  final String pathLocationScreen;

  const ClickableDrawerItem(
      {super.key,
      required this.text,
      required this.svgIcon,
      required this.pathLocationScreen,
      required this.checkForMembership});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: InkWell(
        onTap: () {
          var sbRequest = SubscriptionRequest();
          sbRequest.SubscriptionTypeID = -2;
          if (checkForMembership) {
            if(pathLocationScreen==AppRouters.kAllMemberships){
              GoRouter.of(context).push(AppRouters.kAllMemberships, extra: memberShips);
            }
            else if(pathLocationScreen==AppRouters.kServiceScreen) {
                GoRouter.of(context).push(AppRouters.kServiceScreen, extra: sbRequest);
            } else{
                GoRouter.of(context).push(pathLocationScreen, extra: sbRequest);
            }
          } else {
            GoRouter.of(context).push(pathLocationScreen, extra: sbRequest);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
          child: Row(
            children: [
              SvgPicture.asset(
                svgIcon,
                width: 18,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                text,
                style: Styles.textStyle15W500
                    .copyWith(color: AppColors.whiteLightNew, fontSize: 13.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerAppList extends StatelessWidget {
  const DrawerAppList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // const ClickableDrawerItem(
        //     text: 'عن المنصة',
        //     svgIcon: AppPaths.aboutIconSvg,
        //     pathLocationScreen: AppRouters.kServiceScreen,
        //     checkForMembership: false),
        // getSeparatorView(),
        const ClickableDrawerItem(
            text: 'إشتراكات العضويات',
            svgIcon: AppPaths.membershipIconSvg,
            pathLocationScreen: AppRouters.kAllMemberships,
            checkForMembership: true),
        getSeparatorView(),

        const ClickableDrawerItem(
            text: 'طلبات الدفع',
            svgIcon: AppPaths.moneySvg,
            pathLocationScreen: AppRouters.kPaymentOrdersPage,
            checkForMembership: true),
        getSeparatorView(),

        // const ClickableDrawerItem(text: 'الشبكة الطبية', svgIcon: AppPaths.medicalNetworkIconSvg, pathLocationScreen: AppRouters.kMedicalNetworkScreen),
        // SizedBox(height: 12,),
        ClickableDrawerItem(
            text: StringsManager.medicalNetwork.tr(),
            svgIcon: AppImages.medicalNetwork,
            pathLocationScreen: AppRouters.kMedicalNetworkScreen,
            checkForMembership: false),
        getSeparatorView(),
        const ClickableDrawerItem(
            text: 'السجل المرضي',
            svgIcon: AppPaths.medicalRecordIconSvg,
            pathLocationScreen: AppRouters.kMedicalFileScreen,
            checkForMembership: false),
        getSeparatorView(),

        SizedBox(
          height: 17,
        ),
        // Container(
        //   width: 220,
        //   height: 40,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Container(width: 95,padding: EdgeInsets.all(5),alignment: Alignment.center,
        //           decoration: BoxDecoration(color: AppColors.whiteLightNew,borderRadius: BorderRadius.only(topLeft: Radius.circular(32),bottomLeft:Radius.circular(32) )),
        //           child:  Text('English' , style: Styles.textStyle13W400.copyWith(color: AppColors.secondNew),)),
        //       SizedBox(width: 1,),
        //       Container(width: 95,padding: EdgeInsets.all(5),alignment: Alignment.center,
        //           decoration: BoxDecoration(color: AppColors.whiteLightNew,borderRadius: BorderRadius.only(topRight: Radius.circular(32),bottomRight:Radius.circular(32) )),
        //           child:  Text('العربية' , style: Styles.textStyle13W400.copyWith(color: AppColors.secondNew),)),
        //     ],
        //   ),
        // ),
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () {
            memberShips = [];
            CacheHelper.saveData(key: Token, value: '');
            GoRouter.of(context).pushReplacement(AppRouters.kLoginScreen);
          },
          child: Container(
            alignment: Alignment.center,
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(32.0),
              border: Border.all(color: AppColors.whiteLightNew, width: 1),
              shape: BoxShape.rectangle,
            ),
            child: Text(
              'تسجيل الخروج',
              style: Styles.textStyle12W400.copyWith(
                  color: AppColors.whiteLightNew,
                  backgroundColor: Colors.transparent),
            ),
          ),
        ),
      ],
    );
  }

  getSeparatorView() {
    return Container(
      padding: const EdgeInsets.all(14),
      child: Divider(height: 1, color: Colors.white),
    );
  }
}

class DrawerAppFooter extends StatelessWidget {
  const DrawerAppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTextButton(
              text: 'الشروط والأحكام',
              function: () {
                GoRouter.of(context).push(AppRouters.kShowFileContent,
                    extra: ["conditions.txt", 'الشروط والأحكام']);
              },
              textColor: AppColors.whiteLightNew),
          const Text("|", style: TextStyle(color: AppColors.whiteLightNew)),
          DefaultTextButton(
            text: 'سياسة الخصوصية',
            function: () {
              GoRouter.of(context).push(AppRouters.kShowFileContent,
                  extra: ["personalty.txt", 'سياسة الخصوصية']);
            },
            textColor: AppColors.whiteLightNew,
          ),
        ],
      ),
      flex: 1,
    );
  }
}
