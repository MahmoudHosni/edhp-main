

import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/BackCircleButton.dart';
import 'package:edhp/core/utils/app_components/widgets/BackCircleSmall.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

AppBar getSharedAppBar(BuildContext context, GlobalKey<ScaffoldState> key){
  return AppBar(backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: AppColors.blackColor),
    elevation: 0,
    centerTitle: true,
    title: SvgPicture.asset(AppPaths.logoPath , width: 55,height: 55,),titleSpacing: 0,
    leading: IconButton(
      onPressed: (){

      },
      icon: SvgPicture.asset(AppPaths.notificationIconSvg),
    ),
    actions: [
      IconButton(
        onPressed: (){
          key.currentState!.openDrawer();
        },
        icon: SvgPicture.asset(AppPaths.drawerIconSvg),
      ),
    ],
  );
}

AppBar getSharedAppBarWithBack(BuildContext context,String title){
  return AppBar(backgroundColor: Colors.transparent,
    iconTheme: const IconThemeData(color: AppColors.blackColor),
    elevation: 0,
    centerTitle: true,
    title: Text(title,style: Styles.textStyle16W500.copyWith(color: AppColors.whiteLightNew),),titleSpacing: 0,
    leading: IconButton(
      onPressed: (){

      },
      icon: SvgPicture.asset(AppPaths.notificationIconSvg),
    ),
    actions: [
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: BackCircleSmall(),
      // ),
      IconButton(
        onPressed: (){
          GoRouter.of(context).pop();
        },
        icon: SvgPicture.asset(AppPaths.drawerIconSvg),
      ),
    ],
  );
}