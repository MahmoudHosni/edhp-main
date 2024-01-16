import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              border: Border.all(
                color: AppColors.unselectedColor,
                width: 1,
              ),
            ),
            child: const Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Image(
                image: NetworkImage(
                  'بيانات متغيرة',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'بيانات متغيرة',
                  style: Styles.textStyle195W500
                      .copyWith(color: AppColors.textColorBlue, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'بيانات متغيرة',
                  style: Styles.textStyle195W500
                      .copyWith(color: AppColors.secondNew, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'بيانات متغيرة',
                        style: Styles.textStyle195W500
                            .copyWith(color: AppColors.blackColor, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8,),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.lightGrayColor.withOpacity(0.25),
                              blurRadius: 4,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                            )
                          ],
                          color: AppColors.secondNew),
                      width: 80,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          StringsManager.details.tr(),
                          style: Styles.textStyle195W500.copyWith(
                              color: AppColors.whiteColor, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
