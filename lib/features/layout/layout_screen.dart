import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/styles/styles.dart';
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
  void initState() {
    super.initState();
    GetProfileCubit.get(context).getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutCubit()..getNewAccessToken(context),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
          if (state is ChangeBottomNavigationBarState) {
            // GetProfileCubit.get(context).getProfile();
          }
        },
        builder: (context, state) {
          return Stack(
            children: <Widget>[
              Image.asset(
                "assets/images/bg.png",
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
              ),
              Scaffold(
                backgroundColor: Colors.transparent,
                body: screens[currentIndex],
                bottomNavigationBar: Container(
                  padding: const EdgeInsets.only(left: 2, top: 2, right: 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.secondNew, width: 0.12),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    items: bottomNavigationBarItems,
                    selectedItemColor: AppColors.primaryBlueColor,
                    unselectedItemColor: AppColors.unselectedColor,
                    selectedLabelStyle: Styles.textStyle195W500.copyWith(
                        color: AppColors.textColorBlue, fontSize: 12),
                    unselectedLabelStyle: Styles.textStyle195W500.copyWith(
                    color: AppColors.textColorBlue, fontSize: 12),
                    onTap: (index) {
                      changeBottomIndex(index);
                    },
                    currentIndex: currentIndex,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  int currentIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    const MedicalFileScreen(),
    const CallCenterScreen(),
    const SettingScreen(),
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItems = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppPaths.homeIconOffSvg,
      ),
      activeIcon: SvgPicture.asset(
        AppPaths.homeIconSvg,
      ),
      label: 'الرئيسية',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.medicalFileIconOffSvg),
      activeIcon: SvgPicture.asset(
        AppPaths.medicalFileIconSvg,
      ),
      label: 'الملف الطبي',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(AppPaths.callCenterIconOffSvg),
      activeIcon: SvgPicture.asset(
        AppPaths.callCenterIconSvg,
      ),
      label: 'خدمة العملاء',
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        AppPaths.settingsIconOffSvg,
      ),
      activeIcon: SvgPicture.asset(
        AppPaths.settingsIconSvg,
      ),
      label: 'الاعدادات',
    ),
  ];

  void changeBottomIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
