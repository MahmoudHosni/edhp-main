import 'dart:math';

import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/features/relatives/show/AllRelativesCubit.dart';
import 'package:edhp/features/relatives/show/AllRelativesState.dart';
import 'package:edhp/models/RelativeMembership.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AllRelativesScreen extends StatefulWidget{

  @override
  State<AllRelativesScreen> createState() => _AllRelativesScreenState();
}

class _AllRelativesScreenState extends State<AllRelativesScreen> {
  late AllRelativesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AllRelativesCubit()..getRelatives(),
        child: BlocBuilder<AllRelativesCubit, AllRelativesState>(
            builder: (context, state) {
             cubit = AllRelativesCubit.get(context);

              return ViewContainer(title: StringsManager.all_relatives, showBack: true,
                body: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                  (state is AllRelativesListState) ? Expanded(child: ListView(
                      padding: EdgeInsets.zero, shrinkWrap: false, children: [
                    for(RelativeMembership relative in state.relatives)
                      drawRelative(relative),
                  ])) : const CircularProgressIndicator(),

                  Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: DefaultButton(
                        backgroundColor: AppColors.blue,
                        function: () {
                          GoRouter.of(context).push(AppRouters.kMembershipSelection, extra: memberShips);
                        },
                        text: StringsManager.add_relatives,
                        redius: 32,
                      ))
                ],)

              );
            }));
  }

  drawRelative(RelativeMembership relative) {
    return  InkWell(child: Padding(
      padding:
      const EdgeInsetsDirectional.symmetric(horizontal: 2,vertical: 7),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(color: AppColors.cardBorderNew),
            color:  AppColors.cardBorderNew,
            boxShadow: const [
              BoxShadow(
                color: AppColors.cardBorderNew,
                blurRadius: 1,
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${StringsManager.companyName} :  ${relative.medicalCompanyName}",
                  style: Styles.textStyle13W500
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${StringsManager.name} :  ${relative.subscriberName}",
                  textAlign: TextAlign.start,
                  style: Styles.textStyle13W500.copyWith(
                      color:  Colors.black ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${StringsManager.relation} :  ${relative.relationType}",
                  textAlign: TextAlign.start,
                  style: Styles.textStyle13W500.copyWith(
                      color:  Colors.black ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${StringsManager.membershipNumber} :  ${relative.subscriptionNumber}",
                  textAlign: TextAlign.start,
                  style: Styles.textStyle13W500.copyWith(
                      color:  Colors.black ),
                  maxLines: 2,
                ),
              ],
            ),
            const Spacer(),
            ClipRRect(
              borderRadius:
              const BorderRadius.all(Radius.circular(12)),
              child: Image.network(
                '$baseUrl${EndPoint.imgPath}?referenceTypeId=1&referenceId=${relative.SubscriberProfileID}&id=${Random().nextInt(100000)}',
                fit: BoxFit.fill,
                height: 85,
                width: 85,
                loadingBuilder: (BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value:
                      loadingProgress.expectedTotalBytes !=
                          null
                          ? loadingProgress
                          .cumulativeBytesLoaded /
                          loadingProgress
                              .expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),onTap: (){
      MemberShipsResponse membership = MemberShipsResponse(MedicalCompanyID: relative.medicalCompanyID ??0,
                                                   MembershipTypeID: relative.membershipTypeID ??0,
                                                   OrganizationMembershipNumber: relative.subscriptionNumber,
                                                   OrganizationID: relative.OrganizationID, MembershipTypeName: relative.membershipTypeName ??"",
                                                   OrganizationName: relative.OrganizationName,
                                                   SubscriptionStartDate: relative.subscriptionStartDate ??"",
                                                   SubscriptionEndDate: relative.subscriptionEndDate ??"",
                                                   Gender: relative.gender ??1, SubscriptionTypeID: relative.subscriptionTypeID ??0,
                                                   BirthDate: relative.birthDate ??"", StateID: relative.stateID ??0, CityID: relative.cityID ??0,
                                                   MedicalCompanyName: relative.medicalCompanyName ??"",
                                                   SubscriptionNumber: relative.subscriptionNumber ??"",
                                                   TotalPrice: relative.totalPrice ??0,Name: relative.subscriberName ??"",SubscriberProfileID:relative.SubscriberProfileID ??'');

      GoRouter.of(context).push(AppRouters.kMemberShipPreview,extra: membership);
    },);
  }
}