import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:edhp/features/home/widgets/MemberShipCard.dart';
import 'package:edhp/features/home/widgets/MemberShipGoldCard.dart';
import 'package:flutter/material.dart';

class MemberShipPreview extends StatelessWidget{
  final MemberShipsResponse memberShip;

  MemberShipPreview({required this.memberShip});

  @override
  Widget build(BuildContext context) {
    return ViewContainer(title: "بطاقة عضوية",body: Container(alignment: Alignment.center,
                  child:((memberShip.MembershipTypeName=="Gold Member")? MemberShipGoldCard(memberShip: memberShip, scaler: 1.7, spaceTop: 12,spaceLeft: 1.7,):
                                                                         MemberShipCard(memberShip: memberShip,scaler: 1.7,spaceTop: 12,))
                        ),
    );
  }
}