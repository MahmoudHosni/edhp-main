import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/searchable_text_form_field.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/medical_network/hospitals/outpatient_clinics/outpatient_clinics_cubit.dart';
import 'package:edhp/features/medical_network/hospitals/outpatient_clinics/outpatient_clinics_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutpatientClinicsScreen extends StatelessWidget {
  OutpatientClinicsScreen({
    super.key,
    required this.hospitalId,
  });

  final int hospitalId;
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OutpatientClinicsCubit(hospitalId: hospitalId),
      child: BlocBuilder<OutpatientClinicsCubit, OutpatientClinicsStates>(
        builder: (context, state) {
          OutpatientClinicsCubit cubit = OutpatientClinicsCubit.get(context);

          return ViewContainer(
              title: StringsManager.hospitals.tr(),
              body: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 16, start: 4, end: 4, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        StringsManager.outpatientClinics.tr(),
                        style: Styles.textStyle195W500.copyWith(
                            color: AppColors.blackColor, fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SearchableTextFormField(
                      controller: searchController,
                      hintText: StringsManager.searchByClinic.tr(),
                      valueChanged: (searchText) =>
                          cubit.clinicsFiltered(searchText: searchText),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        StringsManager.clinicClassifications.tr(),
                        style: Styles.textStyle195W500.copyWith(
                            color: AppColors.blackColor, fontSize: 20),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: state is OutpatientClinicsLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryBlueColor,
                              ),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.8,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                crossAxisCount: 3,
                              ),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {},
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
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
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        AppColors.secondNew,
                                        AppColors.blue
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.all(12),
                                      child: Text(
                                        cubit.clinics[index].name,
                                        style: Styles.textStyle195W500.copyWith(
                                            color: AppColors.whiteColor,
                                            fontSize: 16),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              itemCount: cubit.clinics.length,
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
