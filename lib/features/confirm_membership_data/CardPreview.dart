import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/confirm_membership_data/widgets/CardPreviewWidget.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CardPreview extends StatelessWidget{
  final SubscriptionRequest subscriptionRequest;

  CardPreview({required this.subscriptionRequest});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Center(child: Text("معاينة البطاقة", style: Styles.textStyle16W500.copyWith(color: AppColors.blackColor),)),
          actions: [
            InkWell(
              onTap: (){
                GoRouter.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(child: Icon(Icons.arrow_forward_ios,color: Colors.grey),)),
              ),

          ],
        ),
        body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.0),alignment: Alignment.center,
        child: CardPreviewWidget(subscriptionRequest: subscriptionRequest)));
  }

}