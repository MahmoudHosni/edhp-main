import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_paths.dart';
import '../../../core/utils/styles/styles.dart';

class CustomStepThreeAppBar extends StatelessWidget {
  const CustomStepThreeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: InkWell(
        onTap: (){
          GoRouter.of(context).pop();
        },
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 12),
                child: Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.primaryBlueColor,
                          radius: 15,
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: 12,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text('3' , style: Styles.textStyle16W400.copyWith(color: AppColors.primaryBlueColor)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/18,
                      height: 5,
                      color: AppColors.primaryBlueColor,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/18,
                      height: 5,
                      color: AppColors.primaryBlueColor,
                    ),
                    const SizedBox(
                      width: 2,
                    ),Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor:AppColors.primaryBlueColor,
                          radius: 15,
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: 12,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text('2' , style: Styles.textStyle16W400.copyWith(color: AppColors.primaryBlueColor)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/18,
                      height: 5,
                      color: AppColors.primaryBlueColor,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/18,
                      height: 5,
                      color: AppColors.primaryBlueColor,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        const CircleAvatar(
                          backgroundColor: AppColors.primaryBlueColor,
                          radius: 15,
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: 12,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text('1' , style: Styles.textStyle16W400.copyWith(color: AppColors.primaryBlueColor)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text('رجوع' , style: Styles.textStyle16W500.copyWith(color: AppColors.lightGrayColor),),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(AppPaths.backIconSvg ,),
            ],
          ),
        ),
      ),
    );
  }
}
