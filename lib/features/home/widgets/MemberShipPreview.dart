import 'dart:io';

import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MemberShipPreview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewContainer(title: "بطاقة عضوية",body: Container(alignment: Alignment.center,
                        child: Image.file(File(CacheHelper.getData(key: 'MemberShipCard')),fit: BoxFit.fill,height: 245,width: 390,),),
    );
  }
}