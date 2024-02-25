import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class EHDPDropDown<T> extends StatelessWidget {
  const EHDPDropDown({
    super.key,
    required this.list,
    required this.hintText,
    required this.valueChanged,
  });

  final String hintText;
  final List<String> list;
  final ValueChanged<String> valueChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: CustomDropdown(
        hintText: hintText,
        excludeSelected: false,
        decoration: CustomDropdownDecoration(
          closedSuffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.unselectedColor,
          ),
          expandedSuffixIcon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.unselectedColor,
          ),
          closedFillColor: AppColors.cardNew,
          expandedFillColor: AppColors.cardNew,
          expandedShadow: [
            BoxShadow(
              color: AppColors.neutralLightColor.withOpacity(0.25),
              blurRadius: 4,
            )
          ],
          expandedBorder:
              Border.all(color: AppColors.unselectedColor, width: 1),
          hintStyle: Styles.textStyle195W500.copyWith(
            color: AppColors.unselectedColor,
            fontSize: 14,
          ),
          headerStyle: Styles.textStyle195W500.copyWith(
            color: AppColors.blackColor,
            fontSize: 14,
          ),
          listItemStyle: Styles.textStyle195W500.copyWith(
            color: AppColors.blackColor,
            fontSize: 14,
          ),
          closedBorderRadius: BorderRadius.circular(26),
          expandedBorderRadius: BorderRadius.circular(26),
          listItemDecoration: const ListItemDecoration(
              selectedColor: AppColors.unselectedColor),
        ),
        items: list,
        onChanged: (value) => valueChanged(value),
      ),
    );
  }
}
