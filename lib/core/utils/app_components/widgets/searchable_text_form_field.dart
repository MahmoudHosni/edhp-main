import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class SearchableTextFormField extends StatelessWidget {
  const SearchableTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.valueChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String> valueChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.cardNew,
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsetsDirectional.only(top: 14, start: 16),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Styles.textStyle195W500
                .copyWith(color: AppColors.unselectedColor, fontSize: 14),
            suffixIcon: IconButton(
              onPressed: () => valueChanged(controller.text),
              icon: const Padding(
                padding: EdgeInsetsDirectional.only(top: 4),
                child: Icon(
                  Icons.search,
                  size: 32,
                  color: AppColors.unselectedColor,
                ),
              ),
            )),
        style: Styles.textStyle195W500
            .copyWith(color: AppColors.blackColor, fontSize: 14),
      ),
    );
  }
}
