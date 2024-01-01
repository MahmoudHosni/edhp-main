import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';

class CardPreviewWidget extends StatelessWidget{
  final SubscriptionRequest subscriptionRequest;

  CardPreviewWidget({required this.subscriptionRequest});
  
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),child: SizedBox(height: 230,width: 720,child: Stack(children: [
        Image.asset('assets/images/card_Image.jpg',fit: BoxFit.fill,height: 240,width: 720,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

          Flexible(flex: 0,fit: FlexFit.tight,
            child: Container(padding:EdgeInsets.fromLTRB(18, 0, 0, 38),alignment: Alignment.centerLeft,
              child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(8)),child:Image.file(subscriptionRequest!.PersonalImage!,
                fit: BoxFit.cover,width: 80,height: 94,)),
            ),
          ),
          Flexible(flex: 1,fit: FlexFit.tight,
            child:Container(
                padding: const EdgeInsets.all(8.0),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  const SizedBox(height: 32,),
                  Text("Name: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 9,height: 1.2),textAlign: TextAlign.left,),
                  Text(CacheHelper.getData(key: 'profile'),style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 10.5,height: 1.4),textAlign: TextAlign.left),
                  const SizedBox(height: 5,),
                  Text("Mobile: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 9,height: 1.2),textAlign: TextAlign.left,),
                  Text(CacheHelper.getData(key: 'name'),style: TextStyle(color: Color(0xff2f2f2f),fontFamily: 'Droid Arabic Kufi',fontSize: 10.5,height: 1.4),),
                  const SizedBox(height: 5,),
                  Text("Membership Type: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 9,height: 1.2),textAlign: TextAlign.left,),
                  Text(subscriptionRequest!.MembershipTypeName.toString() ??'',style: TextStyle(color: Color(0xff2f2f2f),fontFamily: 'Droid Arabic Kufi',fontSize: 10.5,height: 1.4,),),
                  const SizedBox(height: 5,),
                  Row(children: [
                    Flexible(flex: 0,fit: FlexFit.tight,child: Column(children: [
                      Text("Valid From: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 7,height: 1.2),textAlign: TextAlign.left,),
                      Text(subscriptionRequest.SubscriptionStartDate??'',style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 8.0,height: 1.4),textAlign: TextAlign.left),
                    ],)),
                    SizedBox(width: 15,),
                    Flexible(flex: 0,fit: FlexFit.tight,child: Column(children: [
                      Text("Valid To: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 7,height: 1.2),textAlign: TextAlign.left,),
                      Text(subscriptionRequest.SubscriptionEndDate??'',style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 8.0,height: 1.4),textAlign: TextAlign.left),
                    ],)),
                  ],),
                  const SizedBox(height: 10,),
                  Row(children: [
                      Text("Account : ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 7,height: 1.2),textAlign: TextAlign.left,),
                      Text(subscriptionRequest.OrganizationName??'',style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 8.0,height: 1.4),textAlign: TextAlign.left),
                  ],),

                ],),),
          ),
        ],),


    ],)),);
  }

}