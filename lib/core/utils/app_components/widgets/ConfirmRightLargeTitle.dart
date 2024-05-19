import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class ConfirmRightLargeTitle extends StatelessWidget{
  final String title;

  ConfirmRightLargeTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(width: 115,height: 360,alignment: Alignment.centerRight,padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: AppColors.whiteLightNew,
        borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),),
      child: Text(title,style: Styles.textStyle11W400.copyWith(color: AppColors.secondNew),),
    );
  }
}