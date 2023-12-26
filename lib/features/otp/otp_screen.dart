import 'dart:async';

import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/app_paths.dart';
import '../../core/utils/styles/styles.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();
  TextEditingController number3Controller = TextEditingController();
  TextEditingController number4Controller = TextEditingController();
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 2);

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  /// Timer related methods ///
  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }
  // Step 4
  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }
  // Step 5
  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes:2));
    startTimer();
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: SvgPicture.asset(AppPaths.logoPath),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('كود التحقق' , style: Styles.textStyle32W500,),
                Text('من فضلك ادخل الرقم اللذي تلقيتة الآن علي رقم الهاتف' , style: Styles.textStyle16W400.copyWith(color: const Color(0xFF333333)), textAlign: TextAlign.center,),
                const SizedBox(height: 30,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: DefaultTextFormFieldWithoutLabel(maxLen: 16,
                          controller: number1Controller,
                          keyboardType: TextInputType.number,
                          validation: (value){},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 22,
                      ),
                      Expanded(
                        child: DefaultTextFormFieldWithoutLabel(maxLen: 16,
                          controller: number2Controller,
                          keyboardType: TextInputType.number,
                          validation: (value){},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 22,
                      ),
                      Expanded(
                        child: DefaultTextFormFieldWithoutLabel(maxLen: 16,
                          controller: number3Controller,
                          keyboardType: TextInputType.number,
                          validation: (value){},
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 22,
                      ),
                      Expanded(
                        child: DefaultTextFormFieldWithoutLabel(maxLen: 16,
                          controller: number4Controller,
                          keyboardType: TextInputType.number,
                          validation: (value){},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultButton(
                  text: 'متابعة',
                  function: (){
                    GoRouter.of(context).push(AppRouters.kResetPasswordScreen);
                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                Text('$minutes:$seconds' , style: Styles.textStyle16W600.copyWith(color: AppColors.primaryBlueColor),),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: (){
                        resetTimer();
                      },
                      child: const Text(
                        'إعادة الإرسال',
                        style: TextStyle(
                            color: AppColors.primaryBlueColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            fontFamily: 'Tajawal'
                        ),
                      ),
                    ),
                    Text('لم تستلم الكود ؟' , style: Styles.textStyle16W400.copyWith(color: AppColors.lightGrayColor),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
