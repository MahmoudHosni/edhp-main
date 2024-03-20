import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/doctor_specialist_entity.dart';
import 'package:flutter/material.dart';

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
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorSpecialist.name ?? '',
                  style: Styles.textStyle195W500
                      .copyWith(color: AppColors.textColorBlue, fontSize: 16),
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
                Text(
                  doctorSpecialist.specialist ?? '',
                  style: Styles.textStyle195W500
                      .copyWith(color: AppColors.blackColor, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
