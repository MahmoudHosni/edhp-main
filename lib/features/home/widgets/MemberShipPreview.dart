import 'dart:io';

import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/home/widgets/MemberShipCard.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MemberShipPreview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewContainer(title: "بطاقة عضوية",body: Container(alignment: Alignment.center,
                        child:
                          (memberShips!=null && memberShips.length>0)?
                            MemberShipCard(memberShip: memberShips[0],scaler: 1.7,spaceTop: 12,):SizedBox(),
                        ),
    );
  }
}