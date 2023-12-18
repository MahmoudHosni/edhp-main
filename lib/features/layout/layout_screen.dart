import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/features/call_center/call_center_screen.dart';
import 'package:edhp/features/home/home_screen.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/features/medical_file/medical_file_screen.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:edhp/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'cubit/states.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getNewAccessToken(context),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
          if(state is ChangeBottomNavigationBarState){
            GetProfileCubit.get(context).getProfile();
          }
        },
        builder: (context, state) {
          LayoutCubit cubit = LayoutCubit.get(context);
          return SafeArea(
            child: Scaffold(
              body: screens[currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                items: bottomNavigationBarItems,
                selectedItemColor: AppColors.primaryBlueColor,
                unselectedItemColor: AppColors.lightGrayColor,
                onTap: (index){
                  changeBottomIndex(index);
                },
                currentIndex: currentIndex,
              ),
            ),
          );
        },
      ),
    );
  }

  int currentIndex = 3;

  List<Widget> screens = [
    const SettingScreen(),
    const CallCenterScreen(),
    const MedicalFileScreen(),
    const HomeScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.settingsIconSvg ,),
      label: 'الاعدادات',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.callCenterIconSvg),
      label: 'خدمة العملاء',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.medicalFileIconSvg),
      label: 'الملف الطبي',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.homeIconSvg , color: AppColors.primaryBlueColor,),
      label: 'الرئيسية',
    ),
  ];

  void changeBottomIndex(int index){
    currentIndex = index;
    if(index == 3){
      bottomNavigationBarItems = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.settingsIconSvg ),
          label: 'الاعدادات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.callCenterIconSvg),
          label: 'خدمة العملاء',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.medicalFileIconSvg),
          label: 'الملف الطبي',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.homeIconSvg , color: AppColors.primaryBlueColor,),
          label: 'الرئيسية',
        ),
      ];
    }else if(index ==2){
      bottomNavigationBarItems = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.settingsIconSvg ,),
          label: 'الاعدادات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.callCenterIconSvg),
          label: 'خدمة العملاء',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.medicalFileIconSvg,  color: AppColors.primaryBlueColor,),
          label: 'الملف الطبي',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.homeIconSvg ,),
          label: 'الرئيسية',
        ),
      ];
    }else if(index ==1){
      bottomNavigationBarItems = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.settingsIconSvg ,),
          label: 'الاعدادات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.callCenterIconSvg ,  color: AppColors.primaryBlueColor,),
          label: 'خدمة العملاء',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.medicalFileIconSvg),
          label: 'الملف الطبي',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.homeIconSvg ,),
          label: 'الرئيسية',
        ),
      ];
    }else{
      bottomNavigationBarItems = [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.settingsIconSvg , color: AppColors.primaryBlueColor,),
          label: 'الاعدادات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.callCenterIconSvg),
          label: 'خدمة العملاء',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.medicalFileIconSvg),
          label: 'الملف الطبي',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppPaths.homeIconSvg ,),
          label: 'الرئيسية',
        ),
      ];
    }
    setState(() {

    });
    // emit(ChangeBottomNavigationBarState());
  }
}
