import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmMemberShipCubit.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompaniesCubit.dart';
import 'package:edhp/features/medical_advices/cubit/MedicalAdvicesCubit.dart';
import 'package:edhp/features/individual_membership_data/cubit/cubit.dart';
import 'package:edhp/features/payment/cubit/PaymentCubit.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:edhp/features/relatives/add/AddRelativesCubit.dart';
import 'package:edhp/features/service/cubit/cubit.dart';
import 'package:edhp/features/settings/reset_password/cubit/ResetPasswordCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';
import 'core/network/cache_helper.dart';
import 'core/network/dio_helper.dart';
import 'core/utils/bloc_observer/bloc_observer.dart';
import 'features/organization_membership/organization_membership_data/cubit/cubit.dart';
import 'features/organization_membership/select_the_company/cubit/cubit.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  await EasyLocalization.ensureInitialized();
  // bool ? rememberMe = await CacheHelper.getData(key: 'rememberMe');
  token = await CacheHelper.getData(key: Token);
  print(token);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: AppColors.secondNew.withAlpha(10),
    // navigation bar color
    statusBarColor: AppColors.secondNew.withAlpha(10),
    // status bar color
    statusBarIconBrightness: Brightness.dark,
    // status bar icon color
    systemNavigationBarIconBrightness:
        Brightness.dark, // color of navigation controls
  ));
  // put it on testing state
  OPayTask.setSandBox(true);


  HttpOverrides.global = new MyHttpoverrides();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('ar'), Locale('en')],
        path: 'assets/translations',
        fallbackLocale: const Locale('ar'),
        startLocale: const Locale('ar'),
        child: MyApp(
          accessToken: token,
        )),
  );
}

class MyApp extends StatelessWidget {
  // bool ? rememberMe;
  String? accessToken;

  MyApp(
      {
      // required this.rememberMe ,
      required this.accessToken,
      super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CompanyItemCubit(),//..getOrganizations()
        ),
        BlocProvider(create: (context) => InsuranceCompaniesCubit()),
        BlocProvider(
          create: (context) => GetProfileCubit(),//..getProfile()
        ),
        BlocProvider(
          create: (context) => OurProductCubit(),
        ),
        BlocProvider(create: (context) => OrganizationMembershipDataCubit()), //
        BlocProvider(create: (context) => ConfirmMemberShipCubit()),
        BlocProvider(create: (context) => PaymentCubit()),
        BlocProvider(create: (context) => MembershipDataCubit()),
        BlocProvider(create: (context) => AddRelativesCubit()),
        BlocProvider(create: (context) => MedicalAdvicesCubit()),
        BlocProvider(create: (context) => ResetPasswordCubit())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch:
                generateMaterialColor(color: const Color(0xff2e2c53)),
            scaffoldBackgroundColor: Colors.white,
            backgroundColor:
                generateMaterialColor(color: const Color(0xffFFF8EE)),
            cardColor: generateMaterialColor(color: const Color(0xffF5F5F5)),
            // buttonColor: generateMaterialColor(color: const Color(0xffF5F5F5)),
            focusColor: generateMaterialColor(color: const Color(0xff1f355d)),
            indicatorColor: generateMaterialColor(color: Colors.black54),
            dialogBackgroundColor: generateMaterialColor(
                color: const Color(0xffDB8C8A).withAlpha(255)),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.whiteColor,
              shadowColor: AppColors.whiteColor,
              elevation: 0,
            )),
        routerConfig:
            // (accessToken == null)?
            AppRouters.baseRouter
        // : AppRouters.skipLoginRouter,
        ,
        title: 'EDHP',
        builder: EasyLoading.init(),
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

class MyHttpoverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
