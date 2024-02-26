import 'package:flutter/material.dart';

import '../../app_colors.dart';
import '../../styles/styles.dart';
import 'dart:ui' as ui;

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
  String? error;
  int maxLen;

  DefaultTextFormFieldWithoutLabel({
    Key? key,
    required this.maxLen,
    this.error = '',
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
      color: Colors.transparent,
      height: 34,
      margin: const EdgeInsets.fromLTRB(18, 25, 18, 0),
      child: TextFormField(
        textAlign: TextAlign.center,
        textDirection: ui.TextDirection.ltr,
        maxLength: maxLen,
        enabled: isClickable,
        style: Styles.textStyle12W400,
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
          errorText: error,
          errorStyle: TextStyle(color: Colors.red),
          counterText: '',
          prefixIcon: prefixIcon != null
              ? IconButton(
                  onPressed: onPressedPrefixIcon,
                  icon: Icon(
                    prefixIcon,
                    color: ((error?.length ?? 0) > 0)
                        ? AppColors.lightGrayColor
                        : Colors.red,
                  ),
                )
              : null,
          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: onPressedSuffixIcon,
                  icon: Icon(
                    suffixIcon,
                    color: AppColors.lightGrayColor,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
