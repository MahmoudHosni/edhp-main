import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles/styles.dart';


class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 1.5,
          color: AppColors.neutralLightColor,
        ),
        const Spacer(),
        Text('أو' , style: Styles.textStyle14W400.copyWith(color: AppColors.neutralGrayColor),),
        const Spacer(),
        Container(
          width: MediaQuery.of(context).size.width / 3,
          height: 1.5,
          color: AppColors.neutralLightColor,
        ),
      ],
    );
  }
}
