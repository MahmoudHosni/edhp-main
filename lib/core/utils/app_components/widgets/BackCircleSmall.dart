import 'package:edhp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackCircleSmall extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return InkWell(child: Container(
        height: 14,alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),color: AppColors.whiteLightNew.withAlpha(50)
        ),
        width: 20,
        child: Icon(Icons.arrow_forward_ios,color: Colors.black12,)),onTap: () {
              GoRouter.of(context).pop();
         },);
  }

}