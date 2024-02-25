import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/medical_network_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class MedicalNetworkScreen extends StatelessWidget {
  const MedicalNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
      title: StringsManager.medicalNetwork.tr(),
      body: ListView.separated(
          padding: const EdgeInsetsDirectional.all(4),
          itemCount: medicalNetworkList.length,
          separatorBuilder: (context, index) => Container(height: 12),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                {
                  switch (medicalNetworkList[index].router) {
                    case AppRouters.kHospitalsDataScreen:
                    case AppRouters.kDoctorsSpecialtiesScreen:
                      openUrl(HealthyNetworkLinks.elementAt(index));
                    case AppRouters.kLabsDataScreen:
                      GoRouter.of(context).push(AppRouters.kLabsDataScreen);
                    case AppRouters.kRadiologyCentersDataScreen:
                      GoRouter.of(context)
                          .push(AppRouters.kRadiologyCentersDataScreen);
                    case AppRouters.kMedicalDevicesDataScreen:
                    case AppRouters.kPharmaciesDataScreen:
                      openUrl(HealthyNetworkLinks.elementAt(index));
                  }
                }
              },
              child: SizedBox(
                height: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(AppImages.bgNetwork, fit: BoxFit.fill),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/md_network_${index + 1}.svg',
                          height: 112,
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.only(end: 16),
                          child: Text(
                            medicalNetworkList[index].title,
                            style: Styles.textStyle195W500.copyWith(
                                color: AppColors.whiteColor, fontSize: 24),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
