import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class MedicalEvents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewContainer(
        title: StringsManager.medicalEvents,
        body:const Center(child: Text(StringsManager.noMedicalEvents,style: Styles.textStyle16W600,),)
    );
  }

}