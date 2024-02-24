import 'package:edhp/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_components/widgets/default_text_button.dart';
import '../../../../../core/utils/styles/styles.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';


class RememberMeRow extends StatelessWidget {
  const RememberMeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Row(
          children: [
            // DefaultTextButton(
            //   function: () {
            //     GoRouter.of(context).push(AppRouters.kForgetPasswordScreen);
            //   },
            //   text: 'نسيت كلمة السر؟',
            //   textColor: AppColors.primaryBlueColor,
            // ),
            const Spacer(),
            Text('تذكرني', style: Styles.textStyle12W400.copyWith(
                color: AppColors.lightGrayColor),),
            const SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                LoginCubit.get(context).changeRememberMeState();
              },
              child: Stack(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                            color: AppColors.lightGrayColor,
                            width: 1
                        )
                    ),
                  ),
                  if(LoginCubit.get(context).rememberMe!)
                    const Icon(
                    Icons.check, color: AppColors.lightGrayColor, size: 18,)
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
