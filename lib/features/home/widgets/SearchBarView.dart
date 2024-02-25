import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchBarView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: AppColors.whiteLightNew,
          borderRadius: BorderRadius.circular(22)),
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/icons/search.svg",
            width: 21,
            height: 21,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'ابحث عن أى خدمة طبية',
              style: Styles.textStyle12W400
                  .copyWith(color: AppColors.unselectedColor),
            ),
          )),
          SvgPicture.asset(
            "assets/icons/filter-list.svg",
            width: 32,
            height: 32,
          ),
        ],
      ),
    );
  }
}
