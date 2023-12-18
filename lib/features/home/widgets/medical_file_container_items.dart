import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/styles/styles.dart';

class MedicalFileContainerItem extends StatelessWidget {
  const MedicalFileContainerItem({super.key, required this.mainText, required this.value, required this.iconPath});

  final String mainText;
  final String value;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(mainText , style: Styles.textStyle11W400,),
            Text(value , style: Styles.textStyle11W400,),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        SvgPicture.asset(iconPath ,width: 36,),
      ],
    );
  }
}
