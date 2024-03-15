import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/medical_network/hospitals/hospital_services/hospital_services_cubit.dart';
import 'package:edhp/features/medical_network/hospitals/hospital_services/hospital_services_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalServicesScreen extends StatelessWidget {
  const HospitalServicesScreen({
    super.key,
    required this.hospitalId,
  });

  final int hospitalId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HospitalServicesCubit(hospitalId: hospitalId),
      child: BlocBuilder<HospitalServicesCubit, HospitalServicesStates>(
        builder: (context, state) {
          HospitalServicesCubit cubit = HospitalServicesCubit.get(context);

          return ViewContainer(
              title: StringsManager.hospitalServices.tr(),
              body: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 16, start: 4, end: 4, bottom: 4),
                child: Column(
                  children: [
                    Text(
                      StringsManager.hospitalServices.tr(),
                      style: Styles.textStyle195W500
                          .copyWith(color: AppColors.blackColor, fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: state is HospitalServicesLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryBlueColor,
                              ),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    vertical: 12),
                                child: Text(
                                  cubit.services[index].name,
                                  style: Styles.textStyle195W500.copyWith(
                                      color: AppColors.blackColor,
                                      fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              separatorBuilder: (context, index) => Container(
                                height: 1,
                                color: AppColors.unselectedColor,
                              ),
                              itemCount: cubit.services.length,
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
