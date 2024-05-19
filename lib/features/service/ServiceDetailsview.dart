import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/membership_type_model.dart';
import 'package:flutter/material.dart';

class ServiceDetailsview extends StatelessWidget{
  final MembershipType membershipType;

  ServiceDetailsview({required this.membershipType});

  @override
  Widget build(BuildContext context) {
    var ln = membershipType.description?.length ??0;
    var txt = ln>0? membershipType.description : "لا يوجد";
    return ViewContainer(
        title: membershipType.name ??"",
        body: SingleChildScrollView(
            child:
            Container(width: double.infinity,padding: EdgeInsets.all(6),child: Text( txt ??'', style: Styles.textStyle15W500.copyWith(color: Colors.black),))
          ));
    }

}