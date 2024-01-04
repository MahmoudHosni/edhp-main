import 'dart:io';

import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MemberShipPreview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("بطاقة عضوية", style: Styles.textStyle16W500.copyWith(color: AppColors.blackColor),)),
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
        body: Container(alignment: Alignment.center,
                        child: Image.file(File(CacheHelper.getData(key: 'MemberShipCard')),fit: BoxFit.fill,height: 245,width: 390,),),
    );
  }

}