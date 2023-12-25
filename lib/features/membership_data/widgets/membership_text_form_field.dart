import 'package:flutter/material.dart';

import '../../../core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import '../../../core/utils/styles/styles.dart';

class MembershipTextFormField extends StatelessWidget {

  MembershipTextFormField({
    super.key,required this.error,
    required this.onSummit,
    required this.validation,
    required this.controller,
    required this.textInputType,
    required this.nameOfField,
    this.isClickable = true,
  });
  final String error;
  final String? Function(String? value) onSummit;
  TextEditingController controller;
  TextInputType textInputType;
  final String? Function(String? value) validation;
  final String nameOfField;
  bool isClickable = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: DefaultTextFormFieldWithoutLabel(error: error,
                controller: controller,onSubmit: onSummit,
                keyboardType: textInputType,
                validation: validation,onChange: validation,
                isClickable: isClickable,
              ),
            ),

            Expanded(flex: 1,child: Text(nameOfField , style: Styles.textStyle14W400, textAlign: TextAlign.end,)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
