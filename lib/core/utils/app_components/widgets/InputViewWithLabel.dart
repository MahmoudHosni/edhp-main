import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class InputViewWithLabel extends StatelessWidget {
  final Widget subview;
  final String nameOfField;

  const InputViewWithLabel({required this.subview, required this.nameOfField});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Stack(
        children: [
          Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.transparent,
                  border: Border.all(color: AppColors.secondNew)),
              alignment: Alignment.center,
              child: subview),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: 15,
                  width: 100,
                  margin: EdgeInsets.fromLTRB(3, 0, 25, 35),
                  padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  color: Colors.white,
                  child: Text(
                    nameOfField,
                    style: Styles.textStyle10W400
                        .copyWith(color: AppColors.secondNew),
                  ))),
        ],
      ),
    );
  }
}
