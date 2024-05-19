import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ConfirmLeftLargeValue.dart';
import 'package:edhp/core/utils/app_components/widgets/ConfirmLeftValue.dart';
import 'package:edhp/core/utils/app_components/widgets/ConfirmRightLargeTitle.dart';
import 'package:edhp/core/utils/app_components/widgets/ConfirmRightTitle.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventStates.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventsCubit.dart';
import 'package:edhp/models/MedicalEvent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConditionsAndDetailsView extends StatelessWidget{
  final MedicalEvent event;

  ConditionsAndDetailsView({required this.event});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        MedicalEventsCubit()
          ..getConditionsAndDetailsOfEvent(event.iD ??0),
        child: BlocConsumer<MedicalEventsCubit, MedicalEventStates>(
            listener: (context, state) {  },
            builder:  (context, state) {
              return ViewContainer(
                title: event.name ??'',
                body: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 16, start: 4, end: 4, bottom: 4),
                            child:
                            (state is LoadingMedicalEvents)?
                                  Container(width: double.infinity,alignment: Alignment.center,
                                    child: const CircularProgressIndicator(
                                        color: AppColors.primaryBlueColor),
                                  ) :
                            (state is ConditionsAndDetailsResponse && event.state == 1)?
                             Column(mainAxisSize: MainAxisSize.max,
                                 children: [

                                  Row(textDirection: TextDirection.ltr,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ConfirmLeftValue(
                                            vSide: state.response.resultObject?.eventDateFormatted ??''),
                                        flex: 1,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      ConfirmRightTitle(title: 'التاريخ'),
                                    ],
                                  ),
                                   const SizedBox(height: 8,),
                                  Row(textDirection: TextDirection.ltr,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ConfirmLeftValue(
                                            vSide: state.response.resultObject?.eventPlace ??''),
                                        flex: 1,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      ConfirmRightTitle(title: 'المكان'),
                                    ],
                                  ),
                                   const SizedBox(height: 8,),

                                  Row(textDirection: TextDirection.ltr,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ConfirmLeftValue(
                                            vSide: state.response.resultObject?.attendanceLimit.toString() ??''),
                                        flex: 1,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      ConfirmRightTitle(title: 'العدد المسموح'),
                                    ],
                                  ),
                                   const SizedBox(height: 8,),
                                  Row(textDirection: TextDirection.ltr,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: ConfirmLeftValue(
                                            vSide: state.response.resultObject?.attendanceNumber.toString() ??''),
                                        flex: 1,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      ConfirmRightTitle(title: 'عدد الحضور'),
                                    ],
                                  ),

                                  const SizedBox(height: 8,),
                                   Row(textDirection: TextDirection.ltr,
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Expanded(
                                         child: ConfirmLeftLargeValue(
                                             vSide: state.response.resultObject?.eventTerms ??''),
                                         flex: 1,
                                       ),
                                       SizedBox(
                                         width: 7,
                                       ),
                                       ConfirmRightLargeTitle(title: 'الشروط'),
                                     ],
                                   ),
                                   const SizedBox(height: 8,),
                      ],
                    ):((state is ConditionsAndDetailsResponse && event.state == 2)?
                            Column(mainAxisSize: MainAxisSize.max,
                              children: [
                        Row(textDirection: TextDirection.ltr,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ConfirmLeftLargeValue(
                                  vSide: state.response.resultObject?.description.toString() ??''),
                              flex: 1,
                            ),
                            SizedBox(
                              width: 7,
                            ),
                            ConfirmRightLargeTitle(title: 'التفاصيل'),
                          ],
                        )]):null)
                    ,
              ));
            }));
  }

}