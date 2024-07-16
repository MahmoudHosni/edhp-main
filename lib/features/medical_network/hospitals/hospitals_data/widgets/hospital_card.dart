import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/hospital_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'dart:ui' as ui;

class HospitalCard extends StatelessWidget {
  const HospitalCard({
    super.key,
    required this.hospitalData,
  });

  final HospitalEntity hospitalData;

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
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(20),
                  child: Image(
                    image: NetworkImage(
                      'https://edhp-eg.com/apiPublicUserInterface/GetImage?referenceTypeId=8&referenceId=${hospitalData.id}',
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
                      hospitalData.name ?? '',
                      style: Styles.textStyle195W500.copyWith(
                          color: AppColors.textColorBlue, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            hospitalData.level ?? '',
                            style: Styles.textStyle195W500.copyWith(
                                color: AppColors.secondNew, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        RatingBarIndicator(
                          rating: hospitalData.rating?.toDouble() ?? 0,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: AppColors.secondNew,
                          ),
                          itemCount: 5,
                          itemSize: 20.0,
                          direction: Axis.horizontal,
                          unratedColor: AppColors.lightGray,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(AppImages.location),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  hospitalData.address ?? '',
                  style: Styles.textStyle195W500
                      .copyWith(color: AppColors.blackColor, fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => openUrl('tel://${hospitalData.telephone}'),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImages.phone),
                      const SizedBox(width: 12),
                      Text(
                        hospitalData.telephone ?? '',
                        style: Styles.textStyle195W500
                            .copyWith(color: AppColors.secondNew, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textDirection: ui.TextDirection.ltr,
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   height: 32,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(16),
              //       boxShadow: [
              //         BoxShadow(
              //           color: AppColors.lightGrayColor.withOpacity(0.25),
              //           blurRadius: 4,
              //           spreadRadius: 1,
              //           offset: const Offset(1, 1),
              //         )
              //       ],
              //       color: AppColors.secondNew),
              //   width: 120,
              //   child: TextButton(
              //     onPressed: () => GoRouter.of(context).push(
              //         AppRouters.kOutpatientClinicsScreen,
              //         extra: hospitalData.id),
              //     child: Text(
              //       StringsManager.outpatientClinics.tr(),
              //       style: Styles.textStyle195W500
              //           .copyWith(color: AppColors.whiteColor, fontSize: 12),
              //     ),
              //   ),
              // ),
              const SizedBox(
                width: 8,
              ),
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
                width: 100,//72,
                child: TextButton(
                  onPressed: () => GoRouter.of(context).push(
                      AppRouters.kHospitalServicesScreen,
                      extra: hospitalData.id),
                  child: Text(
                    StringsManager.services.tr(),
                    style: Styles.textStyle195W500
                        .copyWith(color: AppColors.whiteColor, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
