import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NearestHospitalsScreen extends StatelessWidget {
  const NearestHospitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
        title: StringsManager.hospitals.tr(),
        body: Padding(
          padding: const EdgeInsetsDirectional.only(top: 16, bottom: 4),
          child: Column(
            children: [
              Text(
                StringsManager.closestToYou.tr(),
                style: Styles.textStyle195W500
                    .copyWith(color: AppColors.blackColor, fontSize: 20),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: AppColors.lightGray,
                    spreadRadius: 4.0,
                    blurRadius: 52.0,
                  ),
                ]),
                child: CarouselSlider(
                  options: CarouselOptions(
                      enlargeFactor: 0.22,
                      height: 350,
                      viewportFraction: 0.85,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {}),
                  items: [1, 2, 3, 4].map((center) {
                    return Builder(
                      builder: (BuildContext context) {
                        return InkWell(
                          onTap: () {},
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.whiteLightNew,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.lightGray.withOpacity(0.25),
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 1),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  vertical: 32, horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'معمل المختبر',
                                    style: Styles.textStyle195W500.copyWith(
                                        color: AppColors.textColorBlue,
                                        fontSize: 20),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'المستوى',
                                          style: Styles.textStyle195W500.copyWith(
                                              color: AppColors.secondNew, fontSize: 16),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
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
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'شارع الخليفة المأمون',
                                    style: Styles.textStyle195W500.copyWith(
                                        color: AppColors.blackColor,
                                        fontSize: 20),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(AppImages
                                                  .locationPlaceholder),
                                              const SizedBox(width: 8),
                                              Text(
                                                '3.7 km',
                                                style: Styles.textStyle195W500
                                                    .copyWith(
                                                    color: AppColors
                                                        .blackColor,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            StringsManager.distance.tr(),
                                            style: Styles.textStyle195W500
                                                .copyWith(
                                                color: AppColors.secondNew,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  AppImages.clock),
                                              const SizedBox(width: 8),
                                              Text(
                                                '04:36 PM',
                                                style: Styles.textStyle195W500
                                                    .copyWith(
                                                    color: AppColors
                                                        .blackColor,
                                                    fontSize: 20),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            StringsManager.expectedTime.tr(),
                                            style: Styles.textStyle195W500
                                                .copyWith(
                                                color:
                                                AppColors.textColorBlue,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 52,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.lightGrayColor
                                                    .withOpacity(0.25),
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                                offset: const Offset(0, 1),
                                              )
                                            ],
                                            gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              colors: [
                                                AppColors.secondNew,
                                                AppColors.blue
                                              ],
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              StringsManager.services.tr(),
                                              style: Styles.textStyle195W500.copyWith(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12,),
                                      Expanded(
                                        child: Container(
                                          height: 52,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(26),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColors.lightGrayColor
                                                    .withOpacity(0.25),
                                                blurRadius: 1,
                                                spreadRadius: 1,
                                                offset: const Offset(0, 1),
                                              )
                                            ],
                                            gradient: const LinearGradient(
                                              begin: Alignment.topRight,
                                              end: Alignment.bottomLeft,
                                              colors: [
                                                AppColors.secondNew,
                                                AppColors.blue
                                              ],
                                            ),
                                          ),
                                          child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              StringsManager.clinics.tr(),
                                              style: Styles.textStyle195W500.copyWith(
                                                  color: AppColors.whiteColor,
                                                  fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}
