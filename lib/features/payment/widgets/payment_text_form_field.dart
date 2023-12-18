import 'package:flutter/material.dart';

import '../../../core/utils/styles/styles.dart';

class PaymentTextFormField extends StatelessWidget {

  TextEditingController ?controller;
  TextInputType ? textInputType;
  Function(String value) ? onSubmit;
  String? Function( String ? value)? validation;
  Function(String value) ? onChange;
  bool obscureText = false;
  Function() ? onTap;
  int ? maxLines = 1;
  int ? minLines;
  bool isClickable = true;
  String ? fieldName;
  final String text;

  PaymentTextFormField({
    super.key ,
    required this.controller,
    required this.textInputType,
    this.onSubmit,
    required this.validation,
    this.onChange,
    required this.fieldName,
    required this.text,
    this.obscureText = false,
    this.onTap,
    this.maxLines = 1,
    this.minLines,
    this.isClickable = true,
  });



  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(text , style: Styles.textStyle14W500,),
        const SizedBox(
          height: 10,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: SizedBox(
            height: 45,
            child: TextFormField(
              textAlign: TextAlign.right,
              onTap: onTap,
              enabled: isClickable,
              minLines: minLines,
              maxLines: maxLines,
              obscureText: obscureText,
              controller: controller,
              keyboardType: textInputType,
              onFieldSubmitted: onSubmit,
              validator: validation,
              onChanged: onChange,
              decoration: InputDecoration(
                hintText: fieldName,
                hintStyle: Styles.textStyle14W400,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6.0)
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}