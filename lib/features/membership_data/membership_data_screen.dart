import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernorateRegionsView.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernoratesView.dart';
import 'package:edhp/core/utils/app_components/widgets/UserSexType.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/membership_data/cubit/cubit.dart';
import 'package:edhp/features/membership_data/cubit/states.dart';
import 'package:edhp/features/membership_data/widgets/membership_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'widgets/custom_step_one_app_bar.dart';

class MembershipDataScreen extends StatefulWidget {
  MembershipDataScreen({super.key});

  @override
  State<MembershipDataScreen> createState() => _MembershipDataScreenState();
}

class _MembershipDataScreenState extends State<MembershipDataScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController notationIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? maritalStatusSelectedValue;
  MembershipDataCubit? cubit;

  @override
  void initState() {
    super.initState();
    cubit = MembershipDataCubit.get(context);
    cubit?.getSubscriptionInfoLookUps();
    birthDateController.text = cubit?.selectedDate != null ?'${cubit?.selectedDate!.year}/${cubit?.selectedDate!.month}/${cubit?.selectedDate!.day}' : '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MembershipDataCubit, MembershipDataStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomStepOneAppBar(),
                    const Text(StringsManager.resumeMemberShipData , style: Styles.textStyle16W500,),
                    const SizedBox(
                      height: 25,
                    ),
                    MembershipTextFormField(
                      validation: (value){

                      },
                      controller: notationIdController,
                      textInputType: TextInputType.number,
                      nameOfField: 'الرقم القومي',
                    ),
                    GovernoratesView(states: cubit?.subscriptionInfoLookupsModel?.states),
                    const SizedBox(
                      height: 10,
                    ),
                    GovernorateRegionsView(cities: cubit?.subscriptionInfoLookupsModel?.Cities),

                    const SizedBox(
                      height: 10,
                    ),

                    MembershipTextFormField(
                      validation: (value){

                      },
                      controller: phoneNumberController,
                      textInputType: TextInputType.text,
                      nameOfField: 'العنوان',
                    ),

                    UserSexType(genderList: cubit?.subscriptionInfoLookupsModel?.genderList),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: (){
                            MembershipDataCubit.get(context).selectDate(context);
                          },
                          icon: SvgPicture.asset(AppPaths.dateIconSvg),
                        ),
                        Expanded(
                          flex: 6,
                          child: DefaultTextFormFieldWithoutLabel(
                            controller: birthDateController,
                            keyboardType: TextInputType.text,
                            validation: (value){},
                            isClickable: false,
                          ),
                        ),
                        const Expanded(flex: 4,child: Text('تاريخ الميلاد' , style: Styles.textStyle14W400, textAlign: TextAlign.end,)),
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                cubit?.getNotationIdImageFromGallery();
                              },
                              child: Container(height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColors.whiteColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColors.lightGrayColor,
                                        blurRadius: 1,
                                      ),
                                    ]
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SvgPicture.asset(AppPaths.notationIdIconSvg),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text('قم برفع صورة بطاقة الرقم القومي' , style: Styles.textStyle8W400,textAlign: TextAlign.center,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                cubit?.getProfileImageFromGallery();
                              },
                              child: Container(height: 80,alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: AppColors.whiteColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: AppColors.lightGrayColor,
                                        blurRadius: 1,
                                      ),
                                    ]
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        SvgPicture.asset(AppPaths.imageIconSvg),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        const Text('قم برفع صورة لك' , style: Styles.textStyle8W400,textAlign: TextAlign.center,)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    DefaultButton(
                      function: (){
                        GoRouter.of(context).push(AppRouters.kServiceScreen);
                      },
                      text: 'متابعة' ,
                      height: 45,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
);
  }
}
