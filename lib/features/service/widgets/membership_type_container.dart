import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/models/SubscribtionWithMembership.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:edhp/models/membership_type_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_components/widgets/default_button.dart';
import '../../../core/utils/styles/styles.dart';
import '../../layout/cubit/cubit.dart';

class MembershipTypeContainer extends StatelessWidget {
  final MembershipType membershipType;
  final bool clickable;
  final SubscriptionRequest subscriptionRequest;
  const MembershipTypeContainer({super.key, required this.membershipType,required this.subscriptionRequest,required this.clickable});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width / 0.55,
      // height: 500,
      decoration: BoxDecoration(
        color: (membershipType.iD??0) % 2 == 0 ?  AppColors.primaryBlueColor : AppColors.boxesColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(membershipType.name ??'' , style: Styles.textStyle15W500.copyWith(color: (membershipType.iD??0) % 2 == 0 ? AppColors.whiteColor : AppColors.blackColor,),),
          ),

          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(' للمستخدم / ' , style: Styles.textStyle12W400.copyWith(color: (membershipType.iD??0) % 2 == 0 ? AppColors.whiteColor.withOpacity(0.8) : AppColors.blackColor.withOpacity(0.8),),),
              Text((membershipType.price??0).toString() , style: Styles.textStyle20W500.copyWith(color:  (membershipType.iD??0) % 2 == 0 ? AppColors.whiteColor : AppColors.blackColor),),
              Text('  ج.م' , style: Styles.textStyle12W400.copyWith(color: (membershipType.iD??0) % 2 == 0 ? AppColors.whiteColor.withOpacity(0.8) : AppColors.blackColor.withOpacity(0.8),),)
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Divider(color: (membershipType.iD??0) % 2==0 ? AppColors.whiteColor : AppColors.blackColor, thickness: 1,),
          ),
          // const SizedBox(
          //   height: 8,
          // ),
          // Text(description ?? '  ' ,  style: Styles.textStyle12W400.copyWith(color: id % 2 == 0 ? AppColors.whiteColor : AppColors.blackColor),textAlign: TextAlign.center),
          const SizedBox(
            height:5,
          ),
          Container(
              width: 222,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                '$baseUrl${EndPoint.imgPath}?referenceTypeId=5&referenceId=${(membershipType.iD??0)}',
                fit: BoxFit.fill,height: 200,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              )),
          const SizedBox(height: 5,),
          DefaultButton(
            function: (){
                GoRouter.of(context).push(AppRouters.kServiceDetailsview,extra: membershipType);
            },
            text: 'التفاصيل',
            backgroundColor: (membershipType.iD??0) % 2 == 0 ? AppColors.whiteColor : AppColors.unselectedColor,
            redius: 15,
            textColor: (membershipType.iD??0) % 2 == 0 ? AppColors.primaryBlueColor : AppColors.whiteColor,
            width: MediaQuery.of(context).size.width / 2.0,
            height: 44,
          ),
          const SizedBox(height: 5,),
          DefaultButton(
            function: (){
              subscriptionRequest.MembershipTypeID = (membershipType.iD??0);
              subscriptionRequest.MembershipTypeName = (membershipType.name);
              subscriptionRequest.Cost = (membershipType.price??0).toString();
              if(clickable) {
                GoRouter.of(context).push(
                    AppRouters.kConfirmMembershipDataScreen,
                    extra: subscriptionRequest);
              }else if(subscriptionRequest.SubscriptionTypeID==-1){
                GoRouter.of(context).push(AppRouters.kSelectCompanyScreen,extra: subscriptionRequest);
              }else if(subscriptionRequest.SubscriptionTypeID==-2){
                GoRouter.of(context).push(AppRouters.kAddRelativesScreen,extra: SubscribtionWithMembership(subscriptionRequest: subscriptionRequest, memberships: memberShips));
              }
            },
            text: 'اختر عضويتك',
            backgroundColor: (membershipType.iD??0) % 2 == 0 ? AppColors.whiteColor : AppColors.primaryBlueColor,
            redius: 15,
            textColor: (membershipType.iD??0) % 2 == 0 ? AppColors.primaryBlueColor : AppColors.whiteColor,
            width: MediaQuery.of(context).size.width / 2.0,
            height: 44,
          ),
          const SizedBox(height: 6,)
        ],
      ),
    );
  }
}
