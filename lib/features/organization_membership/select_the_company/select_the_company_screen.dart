import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_paths.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class SelectTheCompanyScreen extends StatefulWidget {
  SelectTheCompanyScreen({super.key});

  @override
  State<SelectTheCompanyScreen> createState() => _SelectTheCompanyScreenState();
}

class _SelectTheCompanyScreenState extends State<SelectTheCompanyScreen> {
  TextEditingController notationIdController = TextEditingController();

  TextEditingController clubNumberController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  int organizationID=-1;

  String organizationName='';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyItemCubit, CompanyItemsStates>(
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
                const Text(StringsManager.insuranceCompany , style: Styles.textStyle20W500,),
                const SizedBox(height: 10,),
                Container(width: double.infinity,child: const Text(StringsManager.selectCompany , style: Styles.textStyle14W400,textAlign: TextAlign.right,)),
                const SizedBox(height: 15,),
                if(state is CompanyItemLoadingState)
                  const CircularProgressIndicator(color: AppColors.primaryBlueColor),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2 , crossAxisSpacing: 20),
                    itemBuilder: (_, index) => InkWell(
                      onTap: (){
                        setState(() {
                          organizationID = CompanyItemCubit.get(context).organizationItemsList[index].iD ??-1;
                          organizationName = CompanyItemCubit.get(context).organizationItemsList[index].name ??'';
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0 , horizontal: 1.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: organizationID ==CompanyItemCubit.get(context).organizationItemsList[index].iD ? AppColors.primaryBlueColor : AppColors.whiteColor,
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
                                        imageUrl:'$baseUrl${EndPoint.imgPath}?referenceTypeId=7&referenceId=${CompanyItemCubit.get(context).organizationItemsList[index].iD}&id=${Random().nextInt(100000)}',
                                        fit: BoxFit.fill,height: 85,width: 85,
                                        placeholder: (context, url) =>  Image.asset(AppPaths.companyImage,width: 85,height: 85,),
                                        errorWidget: (context, url, error) => Image.asset(AppPaths.companyImage,width: 85,height: 85,)), ) ,

                                  const SizedBox(height: 2,),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                                    child: Text(CompanyItemCubit.get(context).organizationItemsList[index].name.toString() ,textAlign: TextAlign.center,
                                      style: Styles.textStyle13W400.copyWith(color: organizationID ==CompanyItemCubit.get(context).organizationItemsList[index].iD ? Colors.white : Colors.black),maxLines: 2,),
                                  )
                                ],
                              ),
                            ),
                        ),
                      ),
                    ),
                    itemCount: CompanyItemCubit.get(context).organizationItemsList.length,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                DefaultButton(backgroundColor: (organizationID > 0) ? AppColors.primaryBlueColor : Colors.grey,
                  function: () {
                    if(organizationID<=0){
                      ShowToast.showToast('برجاء اختيار شركة التأمين بصورة صحيحة');
                    }else{
                      var subscriptionRequest = SubscriptionRequest();
                      subscriptionRequest.MedicalCompanyID = organizationID;
                      subscriptionRequest.MedicalCompanyName = organizationName;
                      GoRouter.of(context).push(AppRouters.kCreateMembershipScreen,extra: subscriptionRequest);
                    }
                  },
                  text: StringsManager.select,
                  redius: 10,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10.0),
                //       color: AppColors.whiteColor,
                //       boxShadow: const [
                //         BoxShadow(
                //           color: AppColors.lightGrayColor,
                //           blurRadius: 1,
                //         ),
                //       ]
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(vertical: 20.0 , horizontal: 15.0),
                //     child: Form(
                //       key: formKey,
                //       child: Column(
                //         children: [
                //           Row(
                //             children: [
                //               Expanded(
                //                 flex: 3,
                //                 child: DefaultTextFormFieldWithoutLabel(
                //                   controller: notationIdController,
                //                   keyboardType: TextInputType.number,
                //                   validation: (value){
                //                     if(value!.isEmpty){
                //                       return 'Please enter your notation ID';
                //                     }else{
                //                       return null;
                //                     }
                //                   },
                //                 ),
                //               ),
                //               const Expanded(flex: 2,child: Text('الرقم القومي' , style: Styles.textStyle16W500, textAlign: TextAlign.end,))
                //             ],
                //           ),
                //           const SizedBox(
                //             height: 20,
                //           ),
                //           Row(
                //             children: [
                //               Expanded(
                //                 flex: 3,
                //                 child: DefaultTextFormFieldWithoutLabel(
                //                   controller: clubNumberController,
                //                   keyboardType: TextInputType.number,
                //                   validation: (value){
                //                     if(value!.isEmpty){
                //                       return 'Please enter your club number';
                //                     }else{
                //                       return null;
                //                     }
                //                   },
                //                 ),
                //               ),
                //               const Expanded(flex: 2,child: Text('رقم النادي' , style: Styles.textStyle16W500, textAlign: TextAlign.end,))
                //             ],
                //           ),
                //           const SizedBox(
                //             height: 20,
                //           ),
                //           DefaultButton(
                //             function: (){
                //               if(formKey.currentState!.validate()){
                //                 CompanyItemCubit.get(context).validateOrganizationMember(
                //                   // organizationId: organizationID!,
                //                   identityNumber: notationIdController.text.trim().toString(),
                //                   organizationMembershipNumber: int.parse(clubNumberController.text.trim().toString()),
                //                 ).then((value) {
                //                   GoRouter.of(context).push(AppRouters.kOrganizationSubscriptionScreen);
                //                 });
                //               }
                //             },
                //             text: 'تحقق',
                //           ),
                //           if(state is ValidateOrganizationMemberLoadingState)
                //             const SizedBox(height: 15),
                //           if(state is ValidateOrganizationMemberLoadingState)
                //             const CircularProgressIndicator(color: AppColors.primaryBlueColor,)
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
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
