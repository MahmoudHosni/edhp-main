import 'package:edhp/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_components/widgets/default_button.dart';
import '../../../core/utils/styles/styles.dart';

class MembershipTypeContainer extends StatelessWidget {
  final String price;
  final String name;
  final String description;
  final int index;
  const MembershipTypeContainer({super.key, required this.price, required this.name , required this.description, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height / 2.3,
      decoration: BoxDecoration(
        color: index % 2 == 0 ?  AppColors.primaryBlueColor : AppColors.boxesColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(name , style: Styles.textStyle15W500.copyWith(color: index % 2 == 0 ? AppColors.whiteColor : AppColors.blackColor,),),
          ),

          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' للمستخدم / ' , style: Styles.textStyle12W400.copyWith(color: index % 2 == 0 ? AppColors.whiteColor.withOpacity(0.8) : AppColors.blackColor.withOpacity(0.8),),),
              Text(price , style: Styles.textStyle20W500.copyWith(color:  index % 2 == 0 ? AppColors.whiteColor : AppColors.blackColor),),
              Text('  ج.م' , style: Styles.textStyle12W400.copyWith(color: index % 2 == 0 ? AppColors.whiteColor.withOpacity(0.8) : AppColors.blackColor.withOpacity(0.8),),)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(color: index % 2==0 ? AppColors.whiteColor : AppColors.blackColor, thickness: 1,),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(description ?? '  ' ,  style: Styles.textStyle12W400.copyWith(color:  index % 2 == 0 ? AppColors.whiteColor : AppColors.blackColor),textAlign: TextAlign.center),
          SizedBox(
            height: MediaQuery.of(context).size.height / 14,
          ),
          DefaultButton(
            function: (){
              GoRouter.of(context).push(AppRouters.kConfirmMembershipDataScreen);
            },
            text: 'اختر عضويتك',
            backgroundColor: index % 2 == 0 ? AppColors.whiteColor : AppColors.primaryBlueColor,
            redius: 15,
            textColor: index % 2 == 0 ? AppColors.primaryBlueColor : AppColors.whiteColor,
            width: MediaQuery.of(context).size.width / 2.0,
            height: 44,
          ),
        ],
      ),
    );
  }
}
