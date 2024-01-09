import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {


  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToHomeView();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(width: width,height: height,
      child: Image.asset('assets/images/splash.jpg',fit: BoxFit.fitWidth,)
        
        
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     SizedBox(
        //       height: height / 30,
        //     ),
        //     AnimatedBuilder(
        //       builder: (context, child) => SlideTransition(
        //         position: slidingAnimation,
        //         child: SvgPicture.asset(
        //           AppPaths.logoPath ,
        //           width: width / 1.5,
        //         ),
        //       ),
        //       animation: slidingAnimation,
        //     ),
        //   ],
        // ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(vsync: this , duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero,).animate(animationController);
    animationController.forward();
  }

  navigateToHomeView (){
    Future.delayed(const Duration(seconds: 4) , () {
      GoRouter.of(context).pushReplacement(AppRouters.kLoginScreen);
    },);
  }
}