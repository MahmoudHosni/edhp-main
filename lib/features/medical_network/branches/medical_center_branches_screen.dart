import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/medical_network/branches/medical_center_branches_cubit.dart';
import 'package:edhp/features/medical_network/branches/medical_center_branches_states.dart';
import 'package:edhp/models/medical_network_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MedicalCenterBranchesScreen extends StatelessWidget {
  const MedicalCenterBranchesScreen({
    super.key,
    required this.medicalCenterEntity,
  });

  final MedicalCenterEntity medicalCenterEntity;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MedicalCenterBranchesCubit(medicalCenterId: medicalCenterEntity.id),
      child:
          BlocBuilder<MedicalCenterBranchesCubit, MedicalCenterBranchesStates>(
        builder: (context, state) {
          MedicalCenterBranchesCubit cubit =
              MedicalCenterBranchesCubit.get(context);

          return ViewContainer(
              title: medicalCenterEntity.title,
              body: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 16, start: 4, end: 4, bottom: 4),
                child: Column(
                  children: [
                    Text(
                      '${StringsManager.branchess.tr()} ${medicalCenterEntity.medicalCenterName}',
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: Styles.textStyle195W500
                          .copyWith(color: AppColors.blackColor, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: state is MedicalCenterBranchesLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryBlueColor,
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) => InkWell(
                                child: Padding(
                                  padding:
                                      const EdgeInsetsDirectional.symmetric(
                                          vertical: 12),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cubit.branches[index].title ?? '',
                                        style: Styles.textStyle195W500.copyWith(
                                            color: AppColors.textColorBlue,
                                            fontSize: 16),
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
                                              cubit.branches[index].address ??
                                                  '',
                                              style: Styles.textStyle195W500
                                                  .copyWith(
                                                      color:
                                                          AppColors.blackColor,
                                                      fontSize: 16),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SvgPicture.asset(AppImages.phone),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              cubit.branches[index].phone ?? '',
                                              style: Styles.textStyle195W500
                                                  .copyWith(
                                                      color:
                                                          AppColors.secondNew,
                                                      fontSize: 16),
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
                              itemCount: cubit.branches.length,
                            ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
