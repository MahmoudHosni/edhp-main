import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CallCenterScreen extends StatelessWidget {
  const CallCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewContainer(title: StringsManager.callCenter,showBack: false,body: Center(
      child: SvgPicture.asset('assets/icons/call_centr.svg'),
    ));
  }
}
