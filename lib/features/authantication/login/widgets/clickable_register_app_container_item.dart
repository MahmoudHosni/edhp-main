import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/app_colors.dart';


class ClickableRegisterAppContainerItem extends StatelessWidget {
  final String appLogoPath;

  const ClickableRegisterAppContainerItem({super.key, required this.appLogoPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow:  const [
          BoxShadow(
              blurRadius: 10.0,
              color: AppColors.neutralGrayColor,
              offset: Offset(1 , 1.0)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SvgPicture.asset(appLogoPath),
      ),
    );
  }
}
