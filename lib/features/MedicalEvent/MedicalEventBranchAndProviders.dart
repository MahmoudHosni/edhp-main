

import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventStates.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventsCubit.dart';
import 'package:edhp/models/MedicalEvent.dart';
import 'package:edhp/models/medical_center_branch_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicalEventBranchAndProviders extends StatefulWidget{
  final MedicalEvent event;

  MedicalEventBranchAndProviders({required this.event});

  @override
  State<MedicalEventBranchAndProviders> createState() => _MedicalEventBranchAndProvidersState();
}

class _MedicalEventBranchAndProvidersState extends State<MedicalEventBranchAndProviders> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        MedicalEventsCubit()
          ..getEventServiceProvidersBranches(widget.event.iD ??0),
        child: BlocConsumer<MedicalEventsCubit, MedicalEventStates>(
            listener: (context, state) {

            },
            builder: (context, state) {
              return ViewContainer(
                title: widget.event.name ??'',
                body: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    if (state is LoadingMedicalEvents)
                      const CircularProgressIndicator(
                          color: AppColors.primaryBlueColor),
                    if(state is ShowMedicalCenterBranch)
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              MedicalCenterCardView(item: state.medicalCenters![index]),
                          separatorBuilder: (context, index) =>
                          const SizedBox(
                            height: 8,
                          ),
                          itemCount: state.medicalCenters?.length ?? 0,
                        ),
                      ),
                  ],
                ),
              );
            }));
  }
}

class MedicalCenterCardView extends StatelessWidget {
  final MedicalCenterBranchEntity item;

  MedicalCenterCardView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 6, 0, 8),
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        height: 75,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.whiteLightNew,
            border: Border.all(color: AppColors.cardBorderNew, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Container(alignment: Alignment.centerRight,
              child: Text(
                item.title ?? '',
                style: Styles.textStyle16W600.copyWith(color: AppColors.blackColor),
                textAlign: TextAlign.right,
              ),
            )),
            SizedBox( height: 8,),
            Container(alignment: Alignment.centerRight,
              child: Text(
                item.address ?? '',
                style: Styles.textStyle11W400 .copyWith(color: AppColors.neutralGrayColor),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ));
  }
}