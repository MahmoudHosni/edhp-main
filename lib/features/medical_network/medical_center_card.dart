import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalCenterCard extends StatelessWidget {
  const MedicalCenterCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 12, bottom: 12),
            child: Row(
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
                        'https://www.gardenia.net/wp-content/uploads/2023/05/types-of-flowers.webp',
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
                        'مركز',
                        style: Styles.textStyle195W500.copyWith(
                            color: AppColors.textColorBlue, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
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
                                  color: AppColors.lightGrayColor.withOpacity(0.25),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                  offset: const Offset(1, 1),
                                )
                              ],
                              color: AppColors.secondNew
                            ),
                            width: 80,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                StringsManager.branches.tr(),
                                style: Styles.textStyle195W500
                                    .copyWith(color: AppColors.whiteColor, fontSize: 14),
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
          ),
          Row(children: [
            SvgPicture.asset(AppImages.location),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'معمل المختبر',
                style: Styles.textStyle195W500.copyWith(
                    color: AppColors.blackColor, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],),
          const SizedBox(height: 4,),
          Row(children: [
            SvgPicture.asset(AppImages.phone),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                '01143653252 - 01122355458 - 01266665445',
                style: Styles.textStyle195W500.copyWith(
                    color: AppColors.secondNew, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],),
          const SizedBox(height: 12,),
        ],
      ),
    );
  }
}
