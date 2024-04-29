import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventStates.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventsCubit.dart';
import 'package:edhp/models/EventWithBranchObjects.dart';
import 'package:edhp/models/MedicalEvent.dart';
import 'package:edhp/models/MedicalEventService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MedicalEventServices extends StatefulWidget{
  final MedicalEvent medicalEvent;

  MedicalEventServices({required this.medicalEvent});

  @override
  State<MedicalEventServices> createState() => _MedicalEventServicesState();
}

class _MedicalEventServicesState extends State<MedicalEventServices> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        MedicalEventsCubit()
          ..GetMedicalEventServices(widget.medicalEvent.iD ??1),
        child: BlocConsumer<MedicalEventsCubit, MedicalEventStates>(
            listener: (context, state) {

            },
            builder: (context, state) {
              return ViewContainer(
                title: widget.medicalEvent.name ??"",
                body: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 16, start: 4, end: 4, bottom: 4),
                    child: Column(mainAxisSize: MainAxisSize.max,
                      children: [

                        if (state is LoadingMedicalEvents)
                          Container(width: double.infinity,alignment: Alignment.center,
                            child: const CircularProgressIndicator(
                                color: AppColors.primaryBlueColor),
                          ),
                        if(state is ShowMedicalEventServices)
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context, index) =>
                                  MedicalEventServiceView(medicalEvent: widget.medicalEvent,medicalEventService: state.medicalEventServices![index]),
                              separatorBuilder: (context, index) =>
                              const SizedBox(
                                height: 8,
                              ),
                              itemCount: state.medicalEventServices?.length ?? 0,
                            ),
                          ),
                      ],
                    )),
              );
            }));
  }
}

class MedicalEventServiceView extends StatelessWidget{
  final MedicalEvent medicalEvent;
  final MedicalEventService medicalEventService;

  MedicalEventServiceView({required this.medicalEvent,required this.medicalEventService});

  @override
  Widget build(BuildContext context) {
    return InkWell(child:Container(
        margin: const EdgeInsets.fromLTRB(0, 6, 0, 8),
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.whiteLightNew,
            border: Border.all(color: AppColors.cardBorderNew, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child:
             Center(child:  Text(
              medicalEventService.name ?? '',
              style: Styles.textStyle16W600.copyWith(color: AppColors.blackColor),
              textAlign: TextAlign.right,
            ))),onTap: (){
      GoRouter.of(context).push(AppRouters.kMedicalEventCenters,extra: EventWithBranchObjects(medicalEvent: medicalEvent, medicalEventService: medicalEventService));
    },
          );
  }
}