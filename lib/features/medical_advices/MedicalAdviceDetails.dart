
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/Medical.dart';
import 'package:flutter/material.dart';

class MedicalAdviceDetails extends StatelessWidget{
  final MedicalAdvice advice;

  MedicalAdviceDetails({required this.advice});

  @override
  Widget build(BuildContext context) {
    var txt = (advice.description?.length ??0)>0? advice.description : "لا يوجد";
    return ViewContainer(
        title: StringsManager.medicalAdvices,
        body: Container(height: double.infinity,
          child: SingleChildScrollView(
              child:
                Container(width: double.infinity,padding: EdgeInsets.all(6),child: Text( txt ??'', style: Styles.textStyle16W500.copyWith(color: Colors.black),))
            ),
        ));
  }
}