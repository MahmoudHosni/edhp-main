import 'package:edhp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackCircleButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: AppColors.whiteLightNew),
          width: 40,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black12,
          )),
      onTap: () {
        GoRouter.of(context).pop();
      },
    );
  }
}
