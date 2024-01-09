import 'package:edhp/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import '../../../core/utils/styles/styles.dart';

class MembershipTextFormField extends StatelessWidget {

  MembershipTextFormField({
    super.key,required this.maxLength,required this.error,
    required this.onSummit,
    required this.validation,
    required this.controller,
    required this.textInputType,
    required this.nameOfField,
    this.isClickable = true,
  });
  final int maxLength;
  final String error;
  final String? Function(String? value) onSummit;
  TextEditingController controller;
  TextInputType textInputType;
  final String? Function(String? value) validation;
  final String nameOfField;
  bool isClickable = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 70,
      child: Stack(
            children: [
              Container(margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),color: Colors.transparent,border: Border.all(color: AppColors.secondNew)
                  ),alignment: Alignment.center,
                  child:DefaultTextFormFieldWithoutLabel(maxLen: maxLength,error: error,
                            controller: controller,onSubmit: onSummit,
                            keyboardType: textInputType,
                            validation: validation,onChange: validation,
                            isClickable: isClickable,
                          ),
                        ),
              Align(child: Container(height: 15,width: 100,margin: EdgeInsets.fromLTRB(3, 0, 25, 35),padding: EdgeInsets.fromLTRB(0, 0, 8, 0)
                ,color: Colors.white,child: Text(nameOfField , style: Styles.textStyle10W400.copyWith(color: AppColors.secondNew),textAlign: TextAlign.end,)),alignment: Alignment.centerRight),
            ],
        ),
    );
  }
}
