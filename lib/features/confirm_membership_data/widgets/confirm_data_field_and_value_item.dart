import 'package:flutter/material.dart';

import '../../../core/utils/styles/styles.dart';
import 'dart:ui' as ui;

class ConfirmDataFieldAndValueItem extends StatelessWidget {
  const ConfirmDataFieldAndValueItem(
      {super.key, required this.field, required this.value});

  final String field;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                field,
                style: Styles.textStyle16W500,
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                value,
                style: Styles.textStyle14W400,
                textDirection: ui.TextDirection.ltr,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
