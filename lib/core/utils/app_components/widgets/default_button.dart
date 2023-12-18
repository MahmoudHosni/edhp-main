import 'package:edhp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  late double width;
  late Color backgroundColor;
  late double redius;
  final Function() function;
  final String text;
  late double height;
  late double fontSize;
  late Color textColor;

  DefaultButton({
    Key? key,
    this.width = double.infinity,
    this.backgroundColor = AppColors.primaryBlueColor,
    this.redius = 10.0,
    required this.function,
    required this.text,
    this.textColor = AppColors.whiteColor,
    this.height = 45,
    this.fontSize = 15,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(redius),
      ),
      width: width,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: textColor, fontSize: fontSize , fontFamily: 'Tajawal'),
        ),
      ),
    );
  }
}
