import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/medical_advices/cubit/MedicalAdvicesCubit.dart';
import 'package:edhp/features/medical_advices/cubit/MedicalAdvicesState.dart';
import 'package:edhp/models/Medical.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalAdvices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicalAdvicesCubit()..getAdvices(),
      child: BlocConsumer<MedicalAdvicesCubit, MedicalAdvicesState>(
          listener: (context, state) {},
          builder: (context, state) {
            MedicalAdvicesCubit cubit = MedicalAdvicesCubit.get(context);
            return ViewContainer(
              title: StringsManager.medicalAdvices,
              body: Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  if (state is MedicalAdvicesLoadingState)
                    const CircularProgressIndicator(
                        color: AppColors.primaryBlueColor),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) =>
                          MedicalAdviceCard(item: cubit.medicalLst![index]),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      itemCount: cubit.medicalLst?.length ?? 0,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class MedicalAdviceCard extends StatelessWidget {
  final MedicalAdvice item;

  MedicalAdviceCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        height: 75,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.whiteLightNew,
            border: Border.all(color: AppColors.cardBorderNew, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Text(
          item.name ?? '',
          style: Styles.textStyle13W500.copyWith(color: AppColors.blackColor),
          textAlign: TextAlign.right,
        ));
  }
}
