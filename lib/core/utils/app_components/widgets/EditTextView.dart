

import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditTextView extends StatelessWidget{
  final TextEditingController controller;
  final TextInputType keyboardType;
  Function(String value)? onSubmit;
  final String? Function(String? value) validation;
  Function(String value)? onChange;
  final String fieldName;
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
  TextStyle hintStyle = Styles.textStyle12W400;

  EditTextView({
    Key? key,
    required this.controller,
    required this.keyboardType,
    this.onSubmit,
    required this.validation,
    this.onChange,
    required this.fieldName,
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
    this.hintStyle = Styles.textStyle12W400,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: isClickable,
        minLines: minLines,
        maxLines: maxLines,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        onFieldSubmitted: onSubmit,
        validator: validation,
        onChanged: onChange,
        decoration: InputDecoration(
          hintText: fieldName,
          hintStyle: hintStyle,prefixIconColor: Colors.blue,suffixIconColor: Colors.blue,iconColor: Colors.blue,
          prefixIcon: prefixIcon != null ? IconButton(
            onPressed: onPressedPrefixIcon,
            icon: Icon(
              prefixIcon ,
              color: AppColors.secondNew,
            ),
          ) : null,
          suffixIcon:  suffixIcon != null ? IconButton(
            onPressed: onPressedSuffixIcon,
            icon: Icon(
              suffixIcon,
              color: AppColors.secondNew,
            ),
          ): null,
        ),
      ),
    );
  }
}