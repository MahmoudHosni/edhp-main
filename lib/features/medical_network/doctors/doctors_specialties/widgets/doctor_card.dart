import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/doctor_specialist_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;

import 'package:screenshot/screenshot.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    super.key,
    required this.doctorSpecialist,
  });

  final DoctorSpecialistEntity doctorSpecialist;

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
                      'https://edhp-eg.com/apiPublicUserInterface/GetImage?referenceTypeId=8&referenceId=${doctorSpecialist.id}',
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
                      doctorSpecialist.name ?? '',
                      style: Styles.textStyle195W500.copyWith(
                          color: AppColors.textColorBlue, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      doctorSpecialist.level ?? '',
                      style: Styles.textStyle195W500
                          .copyWith(color: AppColors.secondNew, fontSize: 16),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            doctorSpecialist.name ?? '',
                            style: Styles.textStyle195W500.copyWith(
                                color: AppColors.blackColor, fontSize: 16),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        RatingBarIndicator(
                          rating: doctorSpecialist.rating?.toDouble() ?? 0,
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
                  doctorSpecialist.address ?? '',
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
                  onTap: () => openUrl('tel://${doctorSpecialist.telephone}'),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppImages.phone),
                      const SizedBox(width: 12),
                      Text(
                        doctorSpecialist.telephone ?? '',
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
            ],
          ),
        ],
      ),
    );
  }
}
