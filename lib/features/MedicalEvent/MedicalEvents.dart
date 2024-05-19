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
import 'package:sn_progress_dialog/progress_dialog.dart';

class MedicalEvents extends StatefulWidget{
  @override
  State<MedicalEvents> createState() => _MedicalEventsState();
}

class _MedicalEventsState extends State<MedicalEvents> {
  late MedicalEventsCubit cubit;
  late ProgressDialog pd ;

  @override
  void initState() {
    super.initState();
    pd = ProgressDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        MedicalEventsCubit()
          ..getEvents(),
        child: BlocConsumer<MedicalEventsCubit, MedicalEventStates>(
            listener: (context, state) {
              if(state is CancelMedicalSubscriptionResponse){
                pd.close();
                cubit.getEvents();
              }
            },
            builder: (context, state) {
              cubit = MedicalEventsCubit.get(context);
               return ViewContainer(
                title: StringsManager.medicalEvents,
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
                        if(state is ShowMedicalEvents)
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context, index) =>
                                MedicalEventCardView(item: state.medicalEvents![index],cubit: cubit,pd: pd),
                            separatorBuilder: (context, index) =>
                            const SizedBox(
                              height: 8,
                            ),
                            itemCount: state.medicalEvents?.length ?? 0,
                          ),
                        ),
                  ],
                )),
              );
            }));
  }
}

class MedicalEventCardView extends StatelessWidget {
  final MedicalEvent item;
  final MedicalEventsCubit cubit;
  final ProgressDialog pd;

  MedicalEventCardView({required this.item,required this.cubit,required this.pd});

  @override
  Widget build(BuildContext context) {
    print("${item.registered}");
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 6, 0, 8),
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        height: 175,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.whiteLightNew,
            border: Border.all(color: AppColors.cardBorderNew, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(25))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.fromLTRB(4,8,4,0),
                  child: Text(
                    item.name ?? '',
                    style: Styles.textStyle16W600.copyWith(color: AppColors.blackColor),
                    textAlign: TextAlign.right,
                  ),
                )),

              Expanded(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                    Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                        child: DefaultButton(width: 80,fontSize: 12,textColor:  Colors.black,
                          backgroundColor: Colors.transparent,
                          function: () {
                            item.state = 1;
                            GoRouter.of(context).push(AppRouters.kMedicalEventConditionsAndDetails,extra: item);
                          },
                          text: StringsManager.conditions.tr(),
                          redius: 32,
                        )),
                     Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                        child: DefaultButton(width: 80,
                          backgroundColor: Colors.transparent,fontSize: 12,textColor:  Colors.black,
                          function: () {
                            item.state = 2;
                            GoRouter.of(context).push(AppRouters.kMedicalEventConditionsAndDetails,extra: item);
                          },
                          text: StringsManager.sunsribedetails.tr(),
                          redius: 32,
                        )),

                       Visibility(visible: ((item.IsActive ?? false == true) && (item.registered ?? false)== false) ,child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                          child: DefaultButton(width: 80,
                            backgroundColor: AppColors.unselectedColor,fontSize: 12,textColor:  Colors.black,
                            function: () {
                                GoRouter.of(context).push(AppRouters.kMedicalEventServics,extra: item);
                            },
                            text: StringsManager.subscribe_now.tr(),
                            redius: 32,
                          )),),

                      Visibility(visible: ((item.IsActive ?? false == true) && (item.registered ?? false)== true),child: Padding(
                          padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                          child: DefaultButton(width: 80,
                            backgroundColor: AppColors.unselectedColor,fontSize: 12,textColor:  Colors.black,
                            function: () {
                              cubit.cancelMedicalEventSubscription(item.iD ??0);
                              pd.show(max: 100, msg: StringsManager.please_wait.tr());
                            },
                            text: StringsManager.unsubscribe_now.tr(),
                            redius: 32,
                          )),),
                  ],)),

              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                Visibility(visible: (!(item.IsActive ??false)) ,child: Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                    child: Text('تم انتهاء الفاعلية',
                      style: Styles.textStyle14W500.copyWith(color: AppColors.redColor),
                      textAlign: TextAlign.right,
                    )),),
            ],)
          ],
        ));
  }
}