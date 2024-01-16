import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/medical_network_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MedicalCenterCard extends StatelessWidget {
  const MedicalCenterCard({
    super.key,
    required this.medicalCenterEntity,
  });

  final MedicalCenterEntity medicalCenterEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'بيانات متغيرة',
                      style: Styles.textStyle195W500.copyWith(
                          color: AppColors.textColorBlue, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: AppColors.secondNew,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                          unratedColor: AppColors.lightGray,
                        ),
                        Container(
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGrayColor
                                      .withOpacity(0.25),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: const Offset(1, 1),
                                )
                              ],
                              color: AppColors.secondNew),
                          width: 80,
                          child: TextButton(
                            onPressed: () => GoRouter.of(context).push(
                                AppRouters.kMedicalCenterBranchesScreen,
                                extra: medicalCenterEntity),
                            child: Text(
                              StringsManager.branches.tr(),
                              style: Styles.textStyle195W500.copyWith(
                                  color: AppColors.whiteColor, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SvgPicture.asset(AppImages.location),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'بيانات متغيرة',
                  style: Styles.textStyle195W500
                      .copyWith(color: AppColors.blackColor, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(AppImages.phone),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'بيانات متغيرة',
                  style: Styles.textStyle195W500
                      .copyWith(color: AppColors.secondNew, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
