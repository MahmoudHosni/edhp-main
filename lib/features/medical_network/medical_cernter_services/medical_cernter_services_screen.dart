import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/searchable_text_form_field.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/medical_network_entity.dart';
import 'package:flutter/material.dart';

class MedicalCenterServicesScreen extends StatelessWidget {
  const MedicalCenterServicesScreen({
    super.key,
    required this.medicalCenterEntity,
  });

  final MedicalCenterEntity medicalCenterEntity;

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
        title: medicalCenterEntity.title,
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
              top: 16, start: 4, end: 4, bottom: 4),
          child: Column(
            children: [
              Text(
                medicalCenterEntity.medicalCenterType ==
                        MedicalCenterType.radiologyCenters
                    ? StringsManager.radiologyCenterServices.tr()
                    : StringsManager.medicalDevicesServices.tr(),
                style: Styles.textStyle195W500
                    .copyWith(color: AppColors.blackColor, fontSize: 20),
              ),
              const SizedBox(height: 20),
              SearchableTextFormField(
                controller: TextEditingController(),
                hintText: StringsManager.searchByName.tr(),
                valueChanged: (searchText) {},
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(vertical: 12),
                      child: Text(
                        'بيانات متغيرة',
                        style: Styles.textStyle195W500.copyWith(
                            color: AppColors.textColorBlue, fontSize: 16),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    onTap: () {},
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
  }
}
