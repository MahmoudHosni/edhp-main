import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/medical_network_entity.dart';
import 'package:edhp/models/service_provider_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;

class MedicalCenterCard extends StatelessWidget {
  const MedicalCenterCard({
    super.key,
    required this.medicalCenterEntity,
    required this.serviceProviderEntity,
  });

  final MedicalCenterEntity medicalCenterEntity;
  final ServiceProviderEntity serviceProviderEntity;

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
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  border: Border.all(
                    color: AppColors.unselectedColor,
                    width: 1,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  'https://edhp-eg.com/apiPublicUserInterface/GetImage?referenceTypeId=8&referenceId=${serviceProviderEntity.id}',
                  width: 75,
                  height: 75,
                  fit: BoxFit.cover,
                ),
              ),


              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceProviderEntity.name ?? '',
                      style: Styles.textStyle185W500.copyWith(
                          color: AppColors.textColorBlue, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBarIndicator(
                          rating: serviceProviderEntity.rating?.toDouble() ?? 0,
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
                              style: Styles.textStyle185W500.copyWith(
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
          // Row(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     SvgPicture.asset(AppImages.location),
          //     const SizedBox(width: 12),
          //     Expanded(
          //       child: Text(
          //         serviceProviderEntity.address ?? '',
          //         style: Styles.textStyle185W500
          //             .copyWith(color: AppColors.blackColor, fontSize: 16),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () => openUrl('tel://${serviceProviderEntity.telephone}'),
            child: Row(
              children: [
                SvgPicture.asset(AppImages.phone),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        '${serviceProviderEntity.telephone ?? ''} ${serviceProviderEntity.telephoneTwo ?? ''} ${serviceProviderEntity.telephoneThree ?? ''}',
                        style: Styles.textStyle185W500
                            .copyWith(color: AppColors.secondNew, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: ui.TextDirection.ltr,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
