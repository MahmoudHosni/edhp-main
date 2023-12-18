import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_components/widgets/default_text_form_field.dart';
import '../../../../core/utils/app_paths.dart';
import '../../../../core/utils/styles/styles.dart';


class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
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
                const Text('إعادة تعيين كلمة السر' , style: Styles.textStyle32W500,),
                Text('من فضلك أدخل كلمة مرور جديدة' , style: Styles.textStyle16W400.copyWith(color: const Color(0xFF333333)), textAlign: TextAlign.center,),
                const SizedBox(height: 30,),
                DefaultTextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  validation: (value){

                  },
                  fieldName: 'كلمة السر',
                  suffixIcon: Icons.lock_outline,
                  prefixIcon: Icons.visibility_outlined,
                  onPressedPrefixIcon: (){

                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                DefaultTextFormField(
                  controller: confirmPasswordController,
                  keyboardType: TextInputType.text,
                  validation: (value){

                  },
                  fieldName: 'إعادة تأكبد كلمة السر',
                  suffixIcon: Icons.lock_outline,
                  prefixIcon: Icons.visibility_outlined,
                  onPressedPrefixIcon: (){

                  },
                ),
                const SizedBox(
                  height: 26,
                ),
                DefaultButton(
                  function: (){
                    GoRouter.of(context).push(AppRouters.kLoginScreen);
                  },
                  text: 'تعيين',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
