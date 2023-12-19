import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompaniesCubit.dart';
import 'package:edhp/features/medical_advices/cubit/MedicalAdvicesCubit.dart';
import 'package:edhp/features/membership_data/cubit/cubit.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:edhp/features/service/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/cache_helper.dart';
import 'core/network/dio_helper.dart';
import 'core/utils/bloc_observer/bloc_observer.dart';
import 'features/organization_membership/organization_membership_data/cubit/cubit.dart';
import 'features/organization_membership/select_the_company/cubit/cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  // bool ? rememberMe = await CacheHelper.getData(key: 'rememberMe');
  token = await CacheHelper.getData(key: 'token');
  // print(rememberMe);
  print(token);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black12, // navigation bar color
    statusBarColor: Colors.grey, // status bar color
  ));
  runApp(MyApp(
    // rememberMe: rememberMe,
    accessToken: token,));
}

class MyApp extends StatelessWidget {
  // bool ? rememberMe;
  String ? accessToken;
  MyApp({
    // required this.rememberMe ,
    required this.accessToken ,super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CompanyItemCubit()..getOrganizations(),
        ),
        BlocProvider(
            create: (context)=> InsuranceCompaniesCubit()..getCompanies()),
        BlocProvider(
          create: (context) => GetProfileCubit()..getProfile(),
        ),
        BlocProvider(
          create: (context) => OurProductCubit()..getMembershipType(),
        ),
        BlocProvider(
          create: (context) => OrganizationMembershipDataCubit()
        ),
        BlocProvider(
            create: (context) => MembershipDataCubit()
        ),
        BlocProvider(
            create: (context) => MedicalAdvicesCubit()
        )
      ],
      child: MaterialApp.router(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: generateMaterialColor(color:const Color(0xff2e2c53)),
                  scaffoldBackgroundColor: Colors.white,
                  backgroundColor: generateMaterialColor(color: const Color(0xffFFF8EE)),
                  cardColor: generateMaterialColor(color: const Color(0xffF5F5F5)),
                  // buttonColor: generateMaterialColor(color: const Color(0xffF5F5F5)),
                  focusColor: generateMaterialColor(color: const Color(0xff1f355d)),
                  indicatorColor: generateMaterialColor(color: Colors.black54),
                  dialogBackgroundColor: generateMaterialColor(color: const Color(0xffDB8C8A).withAlpha(255)),

          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.whiteColor,
            shadowColor:  AppColors.whiteColor,
            elevation: 0,
          )
        ),
        routerConfig:
        // (accessToken == null)?
        AppRouters.baseRouter
            // : AppRouters.skipLoginRouter,
       , title: 'EDHP',
      ),
    );
  }

  MaterialColor generateMaterialColor({required Color color}) {
    return MaterialColor(color.value, {
      50: tintColor(color, 0.9),
      100: tintColor(color, 0.8),
      200: tintColor(color, 0.6),
      300: tintColor(color, 0.4),
      400: tintColor(color, 0.2),
      500: color,
      600: shadeColor(color, 0.1),
      700: shadeColor(color, 0.2),
      800: shadeColor(color, 0.3),
      900: shadeColor(color, 0.4),
    });
  }

  int tintValue(int value, double factor) =>
      max(0, min((value + ((255 - value) * factor)).round(), 255));

  Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);
}
