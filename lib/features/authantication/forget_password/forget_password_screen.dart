import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/authantication/forget_password/cubit/ForgetCubit.dart';
import 'package:edhp/features/authantication/forget_password/cubit/ForgetStates.dart';
import 'package:edhp/models/ForgetResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_components/widgets/default_button.dart';
import '../../../core/utils/app_components/widgets/default_text_form_field.dart';
import '../../../core/utils/app_paths.dart';
import '../../../core/utils/styles/styles.dart';


class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetCubit, ForgetStates>(
        listener: (context, state) {  },
        builder: (context, state)  {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: SvgPicture.asset(AppPaths.logoPath),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text('نسيت كلمة السر' , style: Styles.textStyle21W500,textAlign: TextAlign.center,),
                    Text('من فضلك ادخل رقم الهاتف لتتلقي كود لكتابتة' , style: Styles.textStyle12W400.copyWith(color: const Color(0xFF333333)),textAlign: TextAlign.center,),
                    const SizedBox(height: 30,),
                    DefaultTextFormField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      validation: (value){

                      },
                      fieldName: 'رقم الهاتف',
                      suffixIcon: Icons.call_outlined,
                    ),
                    const SizedBox(height: 26,),
                    DefaultButton(
                      function: (){
                        GoRouter.of(context).push(AppRouters.kOtpScreen);
                      },
                      text: ' متابعة',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  });

}
}