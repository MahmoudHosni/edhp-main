import 'dart:math';

import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_colors.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SelectTheCompanyScreen extends StatefulWidget {
  const SelectTheCompanyScreen({super.key});

  @override
  State<SelectTheCompanyScreen> createState() => _SelectTheCompanyScreenState();
}

class _SelectTheCompanyScreenState extends State<SelectTheCompanyScreen> {
  TextEditingController notationIdController = TextEditingController();
  TextEditingController clubNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int organizationID = -1;
  String organizationName = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyItemCubit, CompanyItemsStates>(
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
                StringsManager.insuranceCompany,
                style: Styles.textStyle15W500,
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                StringsManager.selectCompany,
                style: Styles.textStyle10W400,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              if (state is CompanyItemLoadingState)
                const CircularProgressIndicator(
                    color: AppColors.primaryBlueColor),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => const SizedBox(
                    height: 12,
                  ),
                  itemBuilder: (_, index) => InkWell(
                    onTap: () {
                      setState(() {
                        organizationID = CompanyItemCubit.get(context)
                                .organizationItemsList[index]
                                .iD ??
                            -1;
                        organizationName = CompanyItemCubit.get(context)
                                .organizationItemsList[index]
                                .name ??
                            '';
                        var subscriptionRequest = SubscriptionRequest();
                        subscriptionRequest.MedicalCompanyID = organizationID;
                        subscriptionRequest.MedicalCompanyName =
                            organizationName;
                        GoRouter.of(context).push(
                            AppRouters.kCreateMembershipScreen,
                            extra: subscriptionRequest);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: AppColors.cardBorderNew),
                          color: organizationID ==
                                  CompanyItemCubit.get(context)
                                      .organizationItemsList[index]
                                      .iD
                              ? AppColors.unselectedColor
                              : AppColors.cardNew,
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.lightGrayColor,
                              blurRadius: 1,
                            ),
                          ]),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringsManager.companyName,
                                  style: Styles.textStyle12W500
                                      .copyWith(color: AppColors.textColorBlue),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  CompanyItemCubit.get(context)
                                      .organizationItemsList[index]
                                      .name
                                      .toString(),
                                  textAlign: TextAlign.start,
                                  style: Styles.textStyle14W500.copyWith(
                                      color: organizationID ==
                                              CompanyItemCubit.get(context)
                                                  .organizationItemsList[index]
                                                  .iD
                                          ? Colors.white
                                          : AppColors.secondNew),
                                  maxLines: 2,
                                ),
                              ],
                            ),
                            const Spacer(),
                            ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              child: Image.network(
                                '$baseUrl${EndPoint.imgPath}?referenceTypeId=7&referenceId=${CompanyItemCubit.get(context).organizationItemsList[index].iD}&id=${Random().nextInt(100000)}',
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
                  itemCount: CompanyItemCubit.get(context)
                      .organizationItemsList
                      .length,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 25,
              ),

              // Row(children: [
              //   Container(alignment: Alignment.bottomLeft,
              //   child: NextButton(backgroundColor: (organizationID > 0) ? AppColors.secondNew : Colors.grey,
              //     function: () {
              //       if(organizationID<=0){
              //         ShowToast.showToast('برجاء اختيار شركة التأمين بصورة صحيحة');
              //       }else{
              //         var subscriptionRequest = SubscriptionRequest();
              //         subscriptionRequest.MedicalCompanyID = organizationID;
              //         subscriptionRequest.MedicalCompanyName = organizationName;
              //         GoRouter.of(context).push(AppRouters.kCreateMembershipScreen,extra: subscriptionRequest);
              //       }
              //     },
              //     text: StringsManager.select,width: 120,fontSize: 13,
              //     redius: 32,
              //   ),
              // ),
              //   const SizedBox(width: 8,),
              //   BackCircleButton(),
              // ],),

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
