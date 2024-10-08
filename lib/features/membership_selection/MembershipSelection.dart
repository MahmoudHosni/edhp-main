import 'dart:math';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompaniesCubit.dart';
import 'package:edhp/models/MedicalCompany.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MembershipSelection extends StatefulWidget{
  final List<MemberShipsResponse> memberShips;

  const MembershipSelection({super.key, required this.memberShips});

  @override
  State<MembershipSelection> createState() => _MembershipSelectionState();
}

class _MembershipSelectionState extends State<MembershipSelection> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return ViewContainer(title: StringsManager.SelectMembership,body: Container(alignment: Alignment.center,
                      child: ListView(padding: EdgeInsets.zero,shrinkWrap: false, children: [
                          for(MemberShipsResponse membership in widget.memberShips)
                            getMembershipView(membership),
                      ]),
                                    ));
  }

  getMembershipView(MemberShipsResponse membership) {
    return  InkWell(child: Padding(
      padding:
      const EdgeInsetsDirectional.symmetric(horizontal: 2,vertical: 4),
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
                  "${StringsManager.companyName} ${membership.MedicalCompanyName}",
                  style: Styles.textStyle13W500
                      .copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${StringsManager.subscriptionName} ${membership.MembershipTypeName}",
                  textAlign: TextAlign.start,
                  style: Styles.textStyle13W500.copyWith(
                      color:  Colors.black ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${StringsManager.membershipNumber} ${membership.SubscriptionNumber}",
                  textAlign: TextAlign.start,
                  style: Styles.textStyle13W500.copyWith(
                      color:  Colors.black ),
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${StringsManager.MembershipCost} ${membership.TotalPrice}",
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
                '$baseUrl${EndPoint.imgPath}?referenceTypeId=6&referenceId=${membership.MedicalCompanyID}&id=${Random().nextInt(100000)}',
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
      if(membership.OrganizationID==null){
        proceedWithMembership(membership,true);
      }else {
        print("MedicalCompanyID >>>>>>>>>>>>>>  ${membership.MedicalCompanyID.toString()}");
        InsuranceCompaniesCubit.get(context)
            .getCompaniesDirect(membership.MedicalCompanyID.toString()).then((
            value) => onGetCompanies(value, membership));
      }
    },);
  }

  onGetCompanies(List<MedicalCompany> list, MemberShipsResponse membership) {
    print("membership.OrganizationID  >>>>>>>>>>>> ${membership.OrganizationID}");
    print("MedicalCompanies >>>>>>>>  ${list.length}");
    // print(membership.toString());
    var company = list.firstWhere((element) => element.iD==membership.OrganizationID);
    print(company);
    if(company.followerTakesSameMembershipType ??false){
      proceedWithMembership(membership,false);
      print("True >>>>>>>>> followerTakesSameMembershipType");
    }else{
      proceedWithMembership(membership,true);
    }
  }

  void proceedWithMembership(MemberShipsResponse membership,bool goToBaqat) {
    var sbRequest = SubscriptionRequest();
    sbRequest.CityID                       = -2;
    sbRequest.MembershipTypeName           = membership.MembershipTypeName;
    sbRequest.MedicalCompanyName           = membership.MedicalCompanyName;
    sbRequest.MedicalCompanyID             = membership.MedicalCompanyID;
    sbRequest.OrganizationMembershipNumber = membership.OrganizationMembershipNumber;
    sbRequest.OrganizationID               = membership.OrganizationID;
    sbRequest.OrganizationName             = membership.OrganizationName;
    sbRequest.MembershipTypeID             = membership.MembershipTypeID;
    sbRequest.SubscriptionTypeID           = membership.SubscriptionTypeID;
    sbRequest.SubscriptionNumber           = membership.SubscriptionNumber;
    print(membership.SubscriptionNumber);
    if(goToBaqat) {
      GoRouter.of(context).push(AppRouters.kServiceScreen, extra: sbRequest);
    }else{
      sbRequest.MembershipTypeID = (membership.MembershipTypeID);
      sbRequest.MobileNumber = CacheHelper.getData(key: "profile");
      sbRequest.MembershipTypeName = (membership.MembershipTypeName);
      sbRequest.Cost = (membership.TotalPrice).toString();
      GoRouter.of(context).push(AppRouters.kAddRelativesScreen,extra: sbRequest);
    }
  }
}