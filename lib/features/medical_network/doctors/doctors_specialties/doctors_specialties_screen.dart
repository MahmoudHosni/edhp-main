import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/custom_drop_down.dart';
import 'package:edhp/core/utils/app_components/widgets/searchable_text_form_field.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/medical_network/doctors/doctors_specialties/doctors_specialties_cubit.dart';
import 'package:edhp/features/medical_network/doctors/doctors_specialties/doctors_specialties_states.dart';
import 'package:edhp/features/medical_network/doctors/doctors_specialties/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DoctorsSpecialtiesScreen extends StatelessWidget {
  const DoctorsSpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorsSpecialtiesCubit(),
      child: BlocBuilder<DoctorsSpecialtiesCubit, DoctorsSpecialtiesStates>(
        builder: (context, state) {
          DoctorsSpecialtiesCubit cubit = DoctorsSpecialtiesCubit.get(context);

          return ViewContainer(
              title: StringsManager.doctors.tr(),
              body: Padding(
                padding: const EdgeInsetsDirectional.only(
                    top: 16, start: 4, end: 4, bottom: 4),
                child: Column(
                  children: [
                    Text(
                      StringsManager.doctorsSpecialties.tr(),
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
                    EHDPDropDown(
                      list: cubit.areas.map((e) => e.name).toList(),
                      hintText: StringsManager.selectRegion.tr(),
                      valueChanged: (value) => cubit.selectArea(
                          id: cubit.areas
                              .where((element) => element.name == value)
                              .first
                              .id),
                    ),
                    const SizedBox(height: 4),
                    EHDPDropDown(
                      list: ['بيانات متغيرة', 'بيانات متغيرة', 'بيانات متغيرة'],
                      hintText: StringsManager.degree.tr(),
                      valueChanged: (value) {},
                    ),
                    const SizedBox(height: 4),
                    SearchableTextFormField(
                      controller: TextEditingController(),
                      hintText: StringsManager.searchByNameOrSpeciality.tr(),
                      valueChanged: (searchText) {},
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 52,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(26),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightGrayColor.withOpacity(0.25),
                            blurRadius: 40,
                            spreadRadius: 12,
                            offset: const Offset(0, 12),
                          )
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [AppColors.secondNew, AppColors.blue],
                        ),
                      ),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => GoRouter.of(context)
                            .push(AppRouters.kNearestDoctorsScreen),
                        child: Text(
                          StringsManager.closestToYou.tr(),
                          style: Styles.textStyle195W500.copyWith(
                              color: AppColors.whiteColor, fontSize: 20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => InkWell(
                          child: DoctorCard(),
                          onTap: () => GoRouter.of(context)
                              .push(AppRouters.kNearestDoctorsScreen),
                        ),
                        separatorBuilder: (context, index) => Container(
                          height: 1,
                          color: AppColors.unselectedColor,
                        ),
                        itemCount: 10,
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
