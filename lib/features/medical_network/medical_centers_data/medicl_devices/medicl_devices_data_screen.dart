import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/custom_drop_down.dart';
import 'package:edhp/core/utils/app_components/widgets/searchable_text_form_field.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/medical_network/medical_centers_data/medicl_devices/medicl_devices_data_cubit.dart';
import 'package:edhp/features/medical_network/medical_centers_data/medicl_devices/medicl_devices_data_states.dart';
import 'package:edhp/features/medical_network/widgets/medical_center_card.dart';
import 'package:edhp/models/medical_network_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MedicalDevicesDataScreen extends StatelessWidget {
  MedicalDevicesDataScreen({super.key});

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicalDevicesDataCubit(),
      child: BlocBuilder<MedicalDevicesDataCubit, MedicalDevicesDataStates>(
        builder: (context, state) {
          MedicalDevicesDataCubit cubit = MedicalDevicesDataCubit.get(context);

          return ViewContainer(
              title: StringsManager.medicalDevices.tr(),
              body: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 16, start: 4, end: 4, bottom: 4),
                child: Column(
                  children: [
                    Text(
                      StringsManager.medicalDevicesData.tr(),
                      style: Styles.textStyle195W500
                          .copyWith(color: AppColors.blackColor, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    EHDPDropDown(
                      list: cubit.governorates.map((e) => e.name).toList(),
                      hintText: StringsManager.selectGovernorate.tr(),
                      valueChanged: (value) => cubit.selectGovernorate(
                          id: cubit.governorates
                              .where((element) => element.name == value)
                              .first
                              .id),
                    ),
                    const SizedBox(height: 4),
                    SearchableTextFormField(
                      controller: searchController,
                      hintText: StringsManager.searchByName.tr(),
                      valueChanged: (searchText) =>
                          cubit.search(searchText: searchText),
                    ),
                    const SizedBox(height: 20),
                    // Container(
                    //   height: 52,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(26),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: AppColors.lightGrayColor.withOpacity(0.25),
                    //         blurRadius: 40,
                    //         spreadRadius: 12,
                    //         offset: const Offset(0, 12),
                    //       )
                    //     ],
                    //     gradient: const LinearGradient(
                    //       begin: Alignment.topLeft,
                    //       end: Alignment.bottomRight,
                    //       colors: [AppColors.secondNew, AppColors.blue],
                    //     ),
                    //   ),
                    //   width: double.infinity,
                    //   child: TextButton(
                    //     onPressed: () => GoRouter.of(context).push(
                    //       AppRouters.kNearestMedicalCentersScreen,
                    //       extra: MedicalCenterEntity(
                    //         medicalCenterType: MedicalCenterType.medicalDevices,
                    //         title: StringsManager.medicalDevices.tr(),
                    //       ),
                    //     ),
                    //     child: Text(
                    //       StringsManager.closestToYou.tr(),
                    //       style: Styles.textStyle195W500.copyWith(
                    //           color: AppColors.whiteColor, fontSize: 20),
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: state is MedicalDevicesDataLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryBlueColor,
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) => MedicalCenterCard(
                                medicalCenterEntity: MedicalCenterEntity(
                                  medicalCenterType:
                                      MedicalCenterType.medicalDevices,
                                  title: StringsManager.medicalDevices.tr(),
                                  id: cubit.medicalDevices[index].id!,
                                  medicalCenterName:
                                      cubit.medicalDevices[index].name!,
                                ),
                                serviceProviderEntity:
                                    cubit.medicalDevices[index],
                              ),
                              separatorBuilder: (context, index) => Container(
                                height: 1,
                                color: AppColors.unselectedColor,
                              ),
                              itemCount: cubit.medicalDevices.length,
                            ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
