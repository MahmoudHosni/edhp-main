import 'package:edhp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  String text;

  Function() function;
  Color textColor;

  DefaultTextButton({
    super.key,
    required this.text,
    required this.function,
    this.textColor = AppColors.primaryBlueColor
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w400,
          fontSize: 12.5,
          fontFamily: 'Tajawal'
        ),
      ),
    );
  }
}