import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:flutter/material.dart';

class MemberShipGoldCard extends StatelessWidget{
  MemberShipsResponse memberShip;
  double scaler;
  double spaceTop;
  double spaceLeft;

  MemberShipGoldCard({required this.memberShip,required this.scaler,required this.spaceTop,required this.spaceLeft});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(8),child: SizedBox(height: 280,width: 720,child: Stack(children: [
      Image.asset('assets/images/card_Image_gold.jpg',fit: BoxFit.fill,height: 240,width: 720,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,textDirection: TextDirection.ltr,children: [
        const SizedBox(width: 3,),
        Flexible(flex: 0,fit: FlexFit.tight,
          child: Container(padding:EdgeInsets.fromLTRB(20*spaceLeft, 30*scaler,0,0),alignment: Alignment.topCenter,
            child: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(8)),child:Image.network(
              '$baseUrl${EndPoint.imgPath}?referenceTypeId=1&referenceId=${memberShip.SubscriberProfileID}&${DateTime.now().millisecondsSinceEpoch.toString()}',
              fit: BoxFit.fill,width: 45*scaler,height: 45*scaler,)),
          ),
        ),
        const SizedBox(width: 2,),
        Flexible(flex: 1,fit: FlexFit.tight,
          child:Container(height: 200,alignment: Alignment.topLeft,
            padding: EdgeInsets.fromLTRB(8.0,spaceTop,8,8),child: Column(crossAxisAlignment: CrossAxisAlignment.start,textDirection: TextDirection.ltr,children: [
            // SizedBox(height: (20*scaler),),
                Text("NAME: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 5*scaler,height: 1.2,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                Text(memberShip?.Name ??CacheHelper.getData(key: 'profile'),style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 6.0*scaler,fontWeight: FontWeight.bold,height: 1.4),textAlign: TextAlign.left),
                Spacer(),
                Text("Membership No: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 5*scaler,fontWeight: FontWeight.bold,height: 1.2),textAlign: TextAlign.left,),
                Text(memberShip!.SubscriptionNumber,style: TextStyle(color: Color(0xff2f2f2f),fontFamily: 'Droid Arabic Kufi',fontWeight: FontWeight.bold,fontSize: 6.0*scaler,height: 1.4),),
                  Spacer(),
                Text("Membership Type: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 5*scaler,fontWeight: FontWeight.bold,height: 1.2),textAlign: TextAlign.left,),
                Text(memberShip!.MembershipTypeName.toString() ??'',style: TextStyle(color: Color(0xff2f2f2f),fontFamily: 'Droid Arabic Kufi',fontWeight: FontWeight.bold,fontSize: 6.0*scaler,height: 1.4,),),
                  Spacer(),
                Row(textDirection: TextDirection.ltr,children: [
                  Flexible(flex: 0,fit: FlexFit.tight,child: Column(children: [
                    Text("Valid From: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 4*scaler,fontWeight: FontWeight.bold,height: 1.2),textAlign: TextAlign.left,),
                    Text((memberShip.SubscriptionStartDate.length>0)?memberShip.SubscriptionStartDate?.substring(0,10)??'':"",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontWeight: FontWeight.bold,fontSize: 5.0*scaler,height: 1.4),textAlign: TextAlign.left),
                  ],)),
                  const SizedBox(width: 25,),
                  Flexible(flex: 0,fit: FlexFit.tight,child: Column(children: [
                    Text("Valid To: ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 4*scaler,fontWeight: FontWeight.bold,height: 1.2),textAlign: TextAlign.left,),
                    Text((memberShip.SubscriptionEndDate.length>0)?memberShip.SubscriptionEndDate?.substring(0,10)??'':"",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontWeight: FontWeight.bold,fontSize: 5.0*scaler,height: 1.4),textAlign: TextAlign.left),
                  ],)),
                ],),
                SizedBox(height: 10*scaler,),
                Row(textDirection: TextDirection.ltr,children: [
                  Text("Account : ",style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 5*scaler,fontWeight: FontWeight.bold,height: 1.2),textAlign: TextAlign.left,),
                  Text(memberShip.OrganizationName??'',style: TextStyle(color: Colors.black,fontFamily: 'Droid Arabic Kufi',fontSize: 5.0*scaler,fontWeight: FontWeight.bold,height: 1.4),textAlign: TextAlign.left),
                ],),
                Spacer(),
          ],),),
        ),
      ],),


    ],)),);
  }

}