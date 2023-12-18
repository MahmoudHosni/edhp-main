import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../styles/styles.dart';

class DefaultTextFormFieldWithoutLabel extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  Function(String value)? onSubmit;
  final String? Function(String? value) validation;
  Function(String value)? onChange;
  IconData? prefixIcon;
  IconData? suffixIcon;
  Function()? onPressedSuffixIcon;
  Function()? onPressedPrefixIcon;
  bool obscureText = false;
  Function()? onTap;
  int? maxLines = 1;
  int? minLines;
  bool isClickable = true;
  double? radius = 10;

  DefaultTextFormFieldWithoutLabel({Key? key,
  required this.controller,
  required this.keyboardType,
  this.onSubmit,
  required this.validation,
  this.onChange,
  this.prefixIcon,
  this.suffixIcon,
  this.onPressedSuffixIcon,
  this.onPressedPrefixIcon,
  this.obscureText = false,
  this.onTap,
  this.maxLines = 1,
  this.minLines,
  this.isClickable = true,
  this.radius = 10,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius!),
        color: AppColors.boxesColor,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextFormField(
          textAlign: TextAlign.end,
          enabled: isClickable,
          style: Styles.textStyle14W400,
          minLines: minLines,
          maxLines: maxLines,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          onFieldSubmitted: onSubmit,
          validator: validation,
          onChanged: onChange,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: prefixIcon != null ? IconButton(
              onPressed: onPressedPrefixIcon,
              icon: Icon(
                prefixIcon ,
                color: AppColors.lightGrayColor,
              ),
            ) : null,
            suffixIcon:  suffixIcon != null ? IconButton(
              onPressed: onPressedSuffixIcon,
              icon: Icon(
                suffixIcon,
                color: AppColors.lightGrayColor,
              ),
            ): null,
          ),
        ),
      ),
    );
  }
}
