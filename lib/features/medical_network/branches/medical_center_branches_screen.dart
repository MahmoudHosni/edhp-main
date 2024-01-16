import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalCenterBranchesScreen extends StatelessWidget {
  const MedicalCenterBranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
        title: StringsManager.radiologyCenters.tr(),
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 16, start: 4, end: 4, bottom: 4),
          child: Column(
            children: [
              Text(
                'فرع كذا',
                style: Styles.textStyle195W500
                    .copyWith(color: AppColors.blackColor, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مركز',
                            style: Styles.textStyle195W500.copyWith(
                                color: AppColors.textColorBlue, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset(AppImages.location),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  'معمل المختبر',
                                  style: Styles.textStyle195W500.copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppImages.phone),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  '01143653252',
                                  style: Styles.textStyle195W500.copyWith(
                                      color: AppColors.secondNew, fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  separatorBuilder: (context, index) => Container(
                    height: 1,
                    color: AppColors.unselectedColor,
                  ),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ));
  }
}
