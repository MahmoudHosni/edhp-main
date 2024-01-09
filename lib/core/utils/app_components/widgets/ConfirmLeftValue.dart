import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class ConfirmLeftValue extends StatelessWidget{
  final String vSide;

  ConfirmLeftValue({required this.vSide});

  @override
  Widget build(BuildContext context) {
    return Container(width: 85,height: 45,alignment: Alignment.centerRight,padding: EdgeInsets.all(5),
      decoration: BoxDecoration(color: AppColors.whiteLightNew,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),),
      child: Text(vSide,style: Styles.textStyle14W400.copyWith(color: AppColors.secondNew),),
    );
  }

}