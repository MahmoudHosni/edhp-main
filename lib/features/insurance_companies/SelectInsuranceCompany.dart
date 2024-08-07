import 'dart:math';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompaniesCubit.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompanyState.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectInsuranceCompany extends StatefulWidget {
  final SubscriptionRequest subscriptionRequest;

  SelectInsuranceCompany({required this.subscriptionRequest});

  @override
  State<SelectInsuranceCompany> createState() => _SelectInsuranceCompanyState();
}

class _SelectInsuranceCompanyState extends State<SelectInsuranceCompany> {
  final formKey = GlobalKey<FormState>();
  int orgID = -1;
  String orgName = '';

  @override
  void initState() {
    super.initState();
    InsuranceCompaniesCubit.get(context)
        .getCompanies(widget.subscriptionRequest.MedicalCompanyID.toString());
  }

  @override
  Widget build(BuildContext context) {
    print("Member ship :: ${widget.subscriptionRequest.MembershipTypeID}");
    return BlocConsumer<InsuranceCompaniesCubit, InsuranceCompanyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ViewContainer(
          title: StringsManager.memberShips,
          body: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              const Text(
                StringsManager.selectJahah,
                style: Styles.textStyle16W500,
              ),
              const SizedBox(
                height: 16,
              ),
              // if(state is InsuranceCompanyItemLoadingState)
              //   const CircularProgressIndicator(color: AppColors.primaryBlueColor),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      setState(() {
                        orgID = InsuranceCompaniesCubit.get(context)
                                .companiesList[index]
                                .iD ??
                            -1;
                        orgName = InsuranceCompaniesCubit.get(context)
                                .companiesList[index]
                                .name ??
                            '';
                        widget.subscriptionRequest.OrganizationID = orgID;
                        widget.subscriptionRequest.OrganizationName = orgName;
                        if(memberShips.isEmpty) {
                          GoRouter.of(context).push(
                              AppRouters.kOrganizationMembershipDataScreen,
                              extra: widget.subscriptionRequest);
                        }else{
                          GoRouter.of(context).push(
                              AppRouters.kAddAnotherOrganizationMembership,
                              extra: widget.subscriptionRequest);
                        }
                      });
                    },
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 1),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: AppColors.cardBorderNew),
                            color: orgID ==
                                    InsuranceCompaniesCubit.get(context)
                                        .companiesList[index]
                                        .iD
                                ? AppColors.unselectedColor
                                : AppColors.cardNew,
                            boxShadow: const [
                              BoxShadow(
                                color: AppColors.lightGrayColor,
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
                                  StringsManager.jahatName,
                                  style: Styles.textStyle11W400
                                      .copyWith(color: AppColors.textColorBlue),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  InsuranceCompaniesCubit.get(context)
                                          .companiesList[index]
                                          .name ??
                                      '',
                                  textAlign: TextAlign.start,
                                  style: Styles.textStyle13W500.copyWith(
                                      color: orgID ==
                                              InsuranceCompaniesCubit.get(
                                                      context)
                                                  .companiesList[index]
                                                  .iD
                                          ? Colors.white
                                          : Colors.black),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                            const Spacer(),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Image.network(
                                '$baseUrl${EndPoint.imgPath}?referenceTypeId=6&referenceId=${InsuranceCompaniesCubit.get(context).companiesList[index].iD}&id=${Random().nextInt(100000)}',
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
                    ),
                  ),
                  itemCount:
                      InsuranceCompaniesCubit.get(context).companiesList.length,
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height / 33,
              ),
            ],
          ),
        );
      },
    );
  }
}
