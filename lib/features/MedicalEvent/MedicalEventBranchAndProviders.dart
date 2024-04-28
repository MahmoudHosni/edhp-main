import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/custom_drop_down.dart';
import 'package:edhp/core/utils/app_components/widgets/searchable_text_form_field.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_images.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventStates.dart';
import 'package:edhp/features/MedicalEvent/cubit/MedicalEventsCubit.dart';
import 'package:edhp/features/medical_network/branches/medical_center_branches_cubit.dart';
import 'package:edhp/models/EventWithBranchObjects.dart';
import 'package:edhp/models/Governorate.dart';
import 'package:edhp/models/MedicalEvent.dart';
import 'package:edhp/models/MedicalEventService.dart';
import 'package:edhp/models/ServiceProvider.dart';
import 'package:edhp/models/ServiceProviderType.dart';
import 'package:edhp/models/medical_center_branch_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:go_router/go_router.dart';

class MedicalEventBranchAndProviders extends StatefulWidget{
  final EventWithBranchObjects mEvent;

  MedicalEventBranchAndProviders({required this.mEvent});

  @override
  State<MedicalEventBranchAndProviders> createState() => _MedicalEventBranchAndProvidersState();
}

class _MedicalEventBranchAndProvidersState extends State<MedicalEventBranchAndProviders> {
  final searchController = TextEditingController();
  late ProgressDialog pd ;
  Governorate? gov;
  String? govID= '';
  ServiceProviderType?  sProviderType;
  String? sProviderTypeID= '';
  ServiceProvider? sProvider;
  String? sProviderID= '';
  late MedicalEventsCubit cubit;

  @override
  void initState() {
     super.initState();
     pd = ProgressDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (BuildContext context) => MedicalEventsCubit()
                  ..getEventServiceProvidersBranches(widget.mEvent.medicalEventService.iD ??0,widget.mEvent.medicalEvent.iD ??0,)),
           BlocProvider(
            create: (BuildContext context) => MedicalCenterBranchesCubit(medicalCenterId: 1)),
        ],
        child: BlocConsumer<MedicalEventsCubit, MedicalEventStates>(
            listener: (context, state) {
              if (state is MedicalSubscriptionResponse) {
                if(state.response.IsSuccess ??false) {
                  ShowToast.showToastGreen(state.response.Message ??'');
                } else {
                  ShowToast.showToast(state.response.Message ??'');
                }
                GoRouter.of(context).pushReplacement(AppRouters.kLayoutScreen);
              }
            },
            builder: (context, state) {
              cubit = MedicalEventsCubit.get(context);
              return ViewContainer(
                title: widget.mEvent.medicalEventService.name ??'',
                body: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                  Container(child:(state is ShowMedicalCenterBranchWithLookups)?
                    EHDPDropDown(
                      list: state.medicalEventSubscriptionLookups.governorates!.map((e) => e.name ??"").toList(),
                      hintText: gov?.name ??StringsManager.selectGovernorate.tr(),
                      valueChanged: (value) =>
                      {
                        onSelectGovernorate(state.medicalEventSubscriptionLookups.governorates!
                          .where((element) => element.name == value)
                          .first),
                      }
                    ):null),
                    const SizedBox(height: 4),
                    Container(child:(state is ShowMedicalCenterBranchWithLookups)?
                      EHDPDropDown(
                        list: state.medicalEventSubscriptionLookups.serviceProviderType!.map((e) => e.name ??'').toList(),
                        hintText: sProviderType?.name ??StringsManager.selectProvider.tr(),
                        valueChanged: (value) => onSelectServiceProviderType(
                            state.medicalEventSubscriptionLookups.serviceProviderType!
                                .where((element) => element.name == value)
                                .first),
                    ):null),
                    const SizedBox(height: 4),
                    Container(child:(state is ShowMedicalCenterBranchWithLookups)?
                      EHDPDropDown(
                        list: state.medicalEventSubscriptionLookups.serviceProviders!.map((e) => e.name ??'').toList(),
                        hintText: sProvider?.name ??StringsManager.selectService.tr(),
                        valueChanged: (value) => onSelectProvider(
                            state.medicalEventSubscriptionLookups.serviceProviders!
                                .where((element) => element.name == value)
                                .first),
                      ):null),

                    const SizedBox(height: 4),

                    Expanded(
                        child:(state is ShowMedicalCenterBranchWithLookups)? ListView.separated(
                          itemBuilder: (context, index) =>
                              InkWell(child: MedicalCenterCardView(item: state.medicalCenters![index]),onTap: (){
                                cubit.addMedicalEventSubscription(widget.mEvent.medicalEvent.iD ??0, widget.mEvent.medicalEventService.iD ??0, state.medicalCenters![index].id ??0);
                                pd.show(max: 100, msg: StringsManager.please_wait.tr());
                              }),
                          separatorBuilder: (context, index) => Container(
                            height: 1,
                            color: AppColors.unselectedColor,
                          ),
                          itemCount: state.medicalCenters?.length ?? 0,
                        ):const Center(child: const CircularProgressIndicator(
                            color: AppColors.primaryBlueColor),
                        ),
                      ),
                  ],
                ),
              );
            }));
  }

  onSelectGovernorate(Governorate? governorate) {
    govID = governorate?.ID.toString();
    gov = governorate;
    cubit.getEventServiceProvidersBranches(widget.mEvent.medicalEventService.iD ??0,widget.mEvent.medicalEvent.iD ??0,
        serviceProviderTypeID: sProviderTypeID,governorateID: govID,serviceProviderID: sProviderID);
  }

  onSelectServiceProviderType(ServiceProviderType? serviceProviderType) {
    sProviderTypeID = serviceProviderType?.ID.toString();
    sProviderType = serviceProviderType;
    cubit.getEventServiceProvidersBranches(widget.mEvent.medicalEventService.iD ??0,widget.mEvent.medicalEvent.iD ??0,
        serviceProviderTypeID: sProviderTypeID,governorateID: govID,serviceProviderID: sProviderID);
  }

  onSelectProvider(ServiceProvider? serviceProvider) {
    sProviderID = serviceProvider?.ID.toString();
    sProvider = serviceProvider;
    cubit.getEventServiceProvidersBranches(widget.mEvent.medicalEventService.iD ??0,widget.mEvent.medicalEvent.iD ??0,
        serviceProviderTypeID: sProviderTypeID,governorateID: govID,serviceProviderID: sProviderID);
  }


}

class MedicalCenterCardView extends StatelessWidget {
  final MedicalCenterBranchEntity item;

  MedicalCenterCardView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
        const EdgeInsetsDirectional.symmetric(
            vertical: 12),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(
              item.title ?? '',
              style: Styles.textStyle195W500.copyWith(
                  color: AppColors.textColorBlue,
                  fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImages.location),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.address ??
                        '',
                    style: Styles.textStyle195W500
                        .copyWith(
                        color:
                        AppColors.blackColor,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => openUrl(
                  'tel://${item.phone ?? ''}'),
              child: Row(
                crossAxisAlignment:
                CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.phone),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Row(
                      children: [
                        Text(item.phone ?? '',
                          style: Styles.textStyle195W500.copyWith(color: AppColors.secondNew, fontSize: 16),
                          maxLines: 1,
                          overflow:
                          TextOverflow.ellipsis,
                          textDirection:
                          ui.TextDirection.ltr,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}