import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_colors.dart';


class ClickableRegisterAppContainerItem extends StatelessWidget {
  final String appLogoPath;

  const ClickableRegisterAppContainerItem({super.key, required this.appLogoPath});

  @override
  Widget build(BuildContext context) {
    return Material(elevation: 28,shadowColor: Colors.white54,child: SvgPicture.asset(appLogoPath,),color: Colors.transparent,
    );
  }
}
