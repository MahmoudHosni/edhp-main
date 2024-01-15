import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/custom_drop_down.dart';
import 'package:edhp/core/utils/app_components/widgets/searchable_text_form_field.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialtiesScreen extends StatelessWidget {
  const DoctorsSpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                list: ['من'],
                hintText: StringsManager.selectGovernorate.tr(),
                valueChanged: (value) {},
              ),
              const SizedBox(height: 4),
              EHDPDropDown(
                list: ['من'],
                hintText: StringsManager.selectRegion.tr(),
                valueChanged: (value) {},
              ),
              const SizedBox(height: 4),
              EHDPDropDown(
                list: ['من'],
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
                  onPressed: () {},
                  child: Text(
                    StringsManager.closestToYou.tr(),
                    style: Styles.textStyle195W500
                        .copyWith(color: AppColors.whiteColor, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
