import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventStates.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventsCubit.dart';
import 'package:edhp/models/MedicalEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MedicalEvents extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        MedicalEventsCubit()
          ..getEvents(),
        child: BlocConsumer<MedicalEventsCubit, MedicalEventStates>(
            listener: (context, state) {

            },
            builder: (context, state) {
               return ViewContainer(
                title: StringsManager.medicalEvents,
                body: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    if (state is LoadingMedicalEvents)
                      const CircularProgressIndicator(
                          color: AppColors.primaryBlueColor),
                    if(state is ShowMedicalEvents)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            MedicalEventCardView(item: state.medicalEvents![index]),
                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          height: 8,
                        ),
                        itemCount: state.medicalEvents?.length ?? 0,
                      ),
                    ),
                  ],
                ),
              );
            }));
  }

}

class MedicalEventCardView extends StatelessWidget {
  final MedicalEvent item;

  MedicalEventCardView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 6, 0, 8),
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        height: 175,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.whiteLightNew,
            border: Border.all(color: AppColors.cardBorderNew, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(
              item.name ?? '',
              style: Styles.textStyle16W600.copyWith(color: AppColors.blackColor),
              textAlign: TextAlign.right,
            )),

          Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                        child: DefaultButton(width: 80,fontSize: 12,textColor:  Colors.black,
                          backgroundColor: Colors.transparent,
                          function: () {

                          },
                          text: StringsManager.conditions.tr(),
                          redius: 32,
                        )),
                     Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                        child: DefaultButton(width: 80,
                          backgroundColor: Colors.transparent,fontSize: 12,textColor:  Colors.black,
                          function: () {

                          },
                          text: StringsManager.sunsribedetails.tr(),
                          redius: 32,
                        )),
                     Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                        child: DefaultButton(width: 80,
                          backgroundColor: AppColors.unselectedColor,fontSize: 12,textColor:  Colors.black,
                          function: () {
                              GoRouter.of(context).push(AppRouters.kMedicalEventCenters,extra: item);
                          },
                          text: StringsManager.subscribe_now.tr(),
                          redius: 32,
                        )),
                  ],))


          ],
        ));
  }
}