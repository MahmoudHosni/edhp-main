import 'package:cached_network_image/cached_network_image.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/styles/styles.dart';

class DrawerAppHeader extends StatelessWidget {

  final String image;
  final String name;
  final String username;

  DrawerAppHeader({super.key, required this.image, required this.name, required this.username});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2.62,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0,3,0,0),
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                onPressed: (){
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.close , size: 22,),
              ),
            ),
          ),
          Container(
            width: 115,
            height: 115,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
            ),
            clipBehavior: Clip.antiAlias,
            child: CachedNetworkImage(
                    imageUrl: '$baseUrl${EndPoint.imgPath}?referenceTypeId=1&referenceId=${CacheHelper.getData(key: 'id')}',
                    fit: BoxFit.cover,
                    width: 115,
                    height: 115,
                    placeholder: (context, url) =>  Image.asset(AppPaths.profileImage, fit: BoxFit.cover,),
                    errorWidget: (context, url, error) => Image.asset(AppPaths.profileImage, fit: BoxFit.cover,))
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: DefaultButton(
              function: (){
                GoRouter.of(context).push(AppRouters.kProfileScreen);
              },
              text: 'الملف الشخصي' , height: 40,),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(name , style: Styles.textStyle14W400,),
          const SizedBox(
            height: 5,
          ),
          Text(username , style: Styles.textStyle12W400,)
        ],
      ),
    );
  }
}

class ClickableDrawerItem extends StatelessWidget {

  final String text;
  final String svgIcon;
  final String pathLocationScreen;

  const ClickableDrawerItem({super.key, required this.text, required this.svgIcon, required this.pathLocationScreen});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36.0),
      child: InkWell(
        onTap: (){
          GoRouter.of(context).push(pathLocationScreen);
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0 , bottom: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(text , style: Styles.textStyle14W500,),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(svgIcon , width: 18,),
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
        const ClickableDrawerItem(text: 'منتجاتنا', svgIcon: AppPaths.serviceIconSvg ,
            pathLocationScreen: AppRouters.kServiceScreen),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Divider(color: AppColors.neutralGrayColor, thickness: 0.9),
        ),
        const ClickableDrawerItem(text: 'إشتراكات العضويات', svgIcon: AppPaths.membershipIconSvg ,
            pathLocationScreen: AppRouters.kSelectCompanyScreen),//kSelectCompanyScreenAppRouters.kCreateMembershipInsideAppScreen

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Divider(color: AppColors.neutralGrayColor, thickness: 0.9),
        ),

        const ClickableDrawerItem(text: 'الشبكة الطبية', svgIcon: AppPaths.medicalNetworkIconSvg, pathLocationScreen: AppRouters.kMedicalNetworkScreen),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Divider(color: AppColors.neutralGrayColor, thickness: 0.9),
        ),
        const ClickableDrawerItem(text: 'السجل المرضي', svgIcon: AppPaths.medicalRecordIconSvg, pathLocationScreen: AppRouters.kMedicalRecordScreen),
        SizedBox(height: 9,),
        Container(
          width: 150,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: AppColors.boxesColor,
                blurRadius: 10,
                offset: Offset(1, 1), // Shadow position
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('English' , style: Styles.textStyle15W500,),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset(AppPaths.languageIconSvg),
            ],
          ),
        ),
        const SizedBox(height: 8,),
        InkWell(
          onTap: (){
            CacheHelper.saveData(key: 'token', value: '');
            GoRouter.of(context).pushReplacement(AppRouters.kLoginScreen);
          },
          child: Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.boxesColor,
                  blurRadius: 10,
                  offset: Offset(1, 1), // Shadow position
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('تسجيل الخروج' , style: Styles.textStyle15W500,),
                const SizedBox(
                  width: 8,
                ),
                SvgPicture.asset(AppPaths.logoutIconSvg , width: 16, color: Colors.red,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DrawerAppFooter extends StatelessWidget {
  const DrawerAppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              DefaultTextButton(text: 'سياسة الخصوصية', function: (){},),
              const Spacer(),
              DefaultTextButton(text: 'الشروط والأحكام', function: (){},),
            ],
          ),
        ),
        DefaultTextButton(text: 'Powered by commit', function: (){},),
      ],
    );
  }
}
