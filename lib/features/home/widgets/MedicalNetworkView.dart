import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalNetworkView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ViewContainer(title: StringsManager.healthNetwork,
        body: ListView.builder(padding: EdgeInsets.zero,shrinkWrap: true,scrollDirection: Axis.vertical,itemCount: HealthyNetwork.length,itemBuilder: (BuildContext context, int index) {
          return Container(padding: EdgeInsets.all(8),height: 150,
            child: Stack(children: [
              SvgPicture.asset('assets/icons/bg_network.svg',height: 140,fit: BoxFit.fill),
              InkWell(child:Center(
                child: Row(mainAxisAlignment: MainAxisAlignment.center,mainAxisSize: MainAxisSize.max,children: [
                  Center(child: SvgPicture.asset('assets/icons/md_network_${index+1}.svg',height: 120,)),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                    child: Text(HealthyNetwork.elementAt(index),style: Styles.textStyle16W500.copyWith(color: AppColors.whiteColor,fontSize: 15.5),),
                  )
                ]),
              ),onTap: () {
                openUrl(HealthyNetworkLinks.elementAt(index));
              }),
            ],) );
        })
    );
  }

}