import 'dart:math';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompaniesCubit.dart';
import 'package:edhp/features/insurance_companies/cubit/InsuranceCompanyState.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectInsuranceCompany extends StatefulWidget{
  final SubscriptionRequest subscriptionRequest;

  SelectInsuranceCompany({required this.subscriptionRequest});

  @override
  State<SelectInsuranceCompany> createState() => _SelectInsuranceCompanyState();
}

class _SelectInsuranceCompanyState extends State<SelectInsuranceCompany> {
  final formKey = GlobalKey<FormState>();
  int orgID=-1;
  String orgName='';

  @override
  void initState() {
    super.initState();
    InsuranceCompaniesCubit.get(context).getCompanies(widget.subscriptionRequest.MedicalCompanyID.toString());
  }

  @override
  Widget build(BuildContext context) {
    print("Member ship :: ${widget.subscriptionRequest.MembershipTypeID}");
    return BlocConsumer<InsuranceCompaniesCubit, InsuranceCompanyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ViewContainer(title: StringsManager.memberShips,body: Column(
                children: [
                  const SizedBox(
                    height: 11,
                  ),
                  const Text(StringsManager.selectJahah , style: Styles.textStyle16W500,),
                  const SizedBox(height: 15,),
                  // if(state is InsuranceCompanyItemLoadingState)
                  //   const CircularProgressIndicator(color: AppColors.primaryBlueColor),

                  Expanded(
                    child: ListView.builder(shrinkWrap: true,
                      itemBuilder: (_, index) => InkWell(
                        onTap: (){
                          setState(() {
                            orgID = InsuranceCompaniesCubit.get(context).companiesList[index].iD ??-1;
                            orgName = InsuranceCompaniesCubit.get(context).companiesList[index].name ??'';
                            widget.subscriptionRequest.OrganizationID = orgID;
                            widget.subscriptionRequest.OrganizationName = orgName;
                            GoRouter.of(context).push(AppRouters.kOrganizationMembershipDataScreen,extra: widget.subscriptionRequest);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 1.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),border: Border.all(color: AppColors.cardBorderNew),
                                color: orgID == InsuranceCompaniesCubit.get(context).companiesList[index].iD ? AppColors.unselectedColor : AppColors.cardNew,
                                boxShadow: const [
                                  BoxShadow(
                                    color: AppColors.lightGrayColor,
                                    blurRadius: 1,
                                  ),
                                ]
                            ),
                            child:  Container(padding: EdgeInsets.all(8),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12)),
                                    child: Image.network(
                                        '$baseUrl${EndPoint.imgPath}?referenceTypeId=6&referenceId=${InsuranceCompaniesCubit.get(context).companiesList[index].iD}&id=${Random().nextInt(100000)}',
                                        fit: BoxFit.fill,height: 85,width: 85,
                                      loadingBuilder: (BuildContext context, Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) return child;
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress.expectedTotalBytes != null
                                                ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ),
                                  ) ,

                                  const Spacer(),
                                  Column(crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(StringsManager.jahatName , style: Styles.textStyle11W400.copyWith(color: AppColors.textColorBlue),),
                                      const SizedBox(height: 5,),
                                      Text(InsuranceCompaniesCubit.get(context).companiesList[index].name ??'' ,textAlign: TextAlign.start,
                                        style: Styles.textStyle13W500.
                                        copyWith(color: orgID == InsuranceCompaniesCubit.get(context).companiesList[index].iD ? Colors.white:Colors.black),maxLines: 2,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      itemCount: InsuranceCompaniesCubit.get(context).companiesList.length,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 25,
                  ),

                  // Row(children: [
                  //   Container(alignment: Alignment.bottomLeft,
                  //     child: NextButton(backgroundColor: (orgID > 0) ? AppColors.secondNew : Colors.grey,
                  //       function: () {
                  //         if(orgID<=0){
                  //           ShowToast.showToast('برجاء اختيار الهيئة بصورة صحيحة');
                  //         }else{
                  //             widget.subscriptionRequest.OrganizationID = orgID;
                  //             widget.subscriptionRequest.OrganizationName = orgName;
                  //             GoRouter.of(context).push(AppRouters.kOrganizationMembershipDataScreen,extra: widget.subscriptionRequest);
                  //           }
                  //         },
                  //       text: StringsManager.select,width: 120,fontSize: 13,
                  //       redius: 32,
                  //     ),
                  //   ),
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