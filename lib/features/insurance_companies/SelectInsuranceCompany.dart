import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
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
  Widget build(BuildContext context) {
    print("Member ship :: ${widget.subscriptionRequest.MembershipTypeID}");
    return BlocConsumer<InsuranceCompaniesCubit, InsuranceCompanyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Column(
                children: [
                  const BackCustomAppBar(),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(StringsManager.selectJahah , style: Styles.textStyle20W500,),
                  const SizedBox(height: 15,),
                  if(state is InsuranceCompanyItemLoadingState)
                    const CircularProgressIndicator(color: AppColors.primaryBlueColor),
                  Expanded(
                    child: GridView.builder(shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , crossAxisSpacing: 20,),
                      itemBuilder: (_, index) => Container(height: 110,padding: EdgeInsets.fromLTRB(0, 0, 0, 9),
                        child: InkWell(
                          onTap: (){
                            setState(() {
                              orgID = InsuranceCompaniesCubit.get(context).companiesList[index].iD ??-1;
                              orgName = InsuranceCompaniesCubit.get(context).companiesList[index].name ??'';
                            });
                          },
                          child: Container(height: 110,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: orgID == InsuranceCompaniesCubit.get(context).companiesList[index].iD ? AppColors.primaryBlueColor : AppColors.whiteColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.lightGrayColor,
                                      blurRadius: 1,
                                    ),
                                  ]
                              ),
                              child:  Container(padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12)),
                                      child: CachedNetworkImage(
                                                imageUrl:'$baseUrl${EndPoint.imgPath}?referenceTypeId=6&referenceId=${InsuranceCompaniesCubit.get(context).companiesList[index].iD}&id=${Random().nextInt(100000)}',
                                                fit: BoxFit.fill,height: 85,width: 85,
                                                placeholder: (context, url) =>  Image.asset(AppPaths.companyImage,width: 85,height: 85,),
                                                errorWidget: (context, url, error) => Image.asset(AppPaths.companyImage,width: 85,height: 85,)),),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                                      child: Text(InsuranceCompaniesCubit.get(context).companiesList[index].name ??'' ,textAlign: TextAlign.center,
                                        style: Styles.textStyle11W400.
                                                      copyWith(color: orgID == InsuranceCompaniesCubit.get(context).companiesList[index].iD ? Colors.white:Colors.black),maxLines: 2,),
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
                  DefaultButton(backgroundColor: (orgID > 0) ? AppColors.primaryBlueColor : Colors.grey,
                    function: () {
                      if(orgID<=0){
                        ShowToast.showToast('برجاء اختيار الهيئة بصورة صحيحة');
                      }else {
                        widget.subscriptionRequest.OrganizationID = orgID;
                        widget.subscriptionRequest.OrganizationName = orgName;
                        GoRouter.of(context).push(
                            AppRouters.kOrganizationMembershipDataScreen,
                            extra: widget.subscriptionRequest);
                      }
                    },
                    text: StringsManager.select,
                    redius: 10,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}