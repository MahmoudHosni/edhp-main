import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/searchable_text_form_field.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class OutpatientClinicsScreen extends StatelessWidget {
  const OutpatientClinicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  style: Styles.textStyle195W500
                      .copyWith(color: AppColors.blackColor, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
              SearchableTextFormField(
                controller: TextEditingController(),
                hintText: StringsManager.searchByClinic.tr(),
                valueChanged: (searchText) {},
              ),
              const SizedBox(height: 12),
              Text(
                StringsManager.recentlySearched.tr(),
                style: Styles.textStyle195W500
                    .copyWith(color: AppColors.blackColor, fontSize: 14),
              ),
              const Divider(
                color: AppColors.unselectedColor,
              ),
              SizedBox(
                height: 28,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: 112,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.unselectedColor, width: 1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        'بيانات متغيرة',
                        style: Styles.textStyle195W500.copyWith(
                            color: AppColors.lightGrayColor, fontSize: 12),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => Container(
                    width: 12,
                  ),
                  itemCount: 10,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Text(
                  StringsManager.clinicClassifications.tr(),
                  style: Styles.textStyle195W500
                      .copyWith(color: AppColors.blackColor, fontSize: 20),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            color: AppColors.lightGrayColor.withOpacity(0.25),
                            blurRadius: 1,
                            spreadRadius: 1,
                            offset: const Offset(0, 1),
                          )
                        ],
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [AppColors.secondNew, AppColors.blue],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.all(8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              image: NetworkImage(
                                  'بيانات متغيرة'),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'بيانات متغيرة',
                              style: Styles.textStyle195W500.copyWith(
                                  color: AppColors.whiteColor, fontSize: 12),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: 20,
                ),
              ),
            ],
          ),
        ));
  }
}
