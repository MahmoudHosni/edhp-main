import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernorateRegionsView.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernoratesView.dart';
import 'package:edhp/core/utils/app_components/widgets/UserSexType.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/membership_data/widgets/membership_text_form_field.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/cubit.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/states.dart';
import 'package:edhp/features/organization_membership/select_the_company/cubit/cubit.dart';
import 'package:edhp/models/validate_organization_member_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import '../../membership_data/widgets/custom_step_one_app_bar.dart';


class OrganizationMembershipDataScreen extends StatefulWidget {
  OrganizationMembershipDataScreen({super.key});

  @override
  State<OrganizationMembershipDataScreen> createState() => _OrganizationMembershipDataScreenState();
}

class _OrganizationMembershipDataScreenState extends State<OrganizationMembershipDataScreen> {
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  String? genderSelectedValue;
  String ? governorateSelectedValue;
  String? maritalStatusSelectedValue;
  TextEditingController region = TextEditingController();
  TextEditingController address = TextEditingController();
  OrganizationMembershipDataCubit? cubit ;

  @override
  void initState() {
    super.initState();
    cubit = OrganizationMembershipDataCubit.get(context);
    cubit?.getSubscriptionInfoLookUps();
    birthDate.text = cubit?.selectedBirthDate != null ? '${cubit?.selectedBirthDate!.year} / ${cubit?.selectedBirthDate!.month} / ${cubit?.selectedBirthDate!.day}' : '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrganizationMembershipDataCubit, OrganizationMembershipDataStates>(
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
                  const Text('بيانات عضوية الشركة' , style: Styles.textStyle20W500,),
                  const SizedBox(
                    height: 40,
                  ),

                  MembershipTextFormField(
                    validation: (value){

                    },
                    controller: identityNumberController,
                    textInputType: TextInputType.number,
                    nameOfField: 'الرقم القومي',
                  ),
                  MembershipTextFormField(
                    validation: (value){},
                    controller: identityNumberController,
                    textInputType: TextInputType.text,
                    nameOfField: 'رقم العضوية',
                    isClickable: false,
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
                    validation: (value){},
                    controller: address,
                    textInputType: TextInputType.text,
                    nameOfField: 'العنوان',
                    isClickable: false,
                  ),
                  UserSexType(genderList: cubit?.subscriptionInfoLookupsModel?.genderList),
                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          OrganizationMembershipDataCubit.get(context).selectBirthDate(context);
                        },
                        icon: SvgPicture.asset(AppPaths.dateIconSvg),
                      ),
                      Expanded(
                        flex: 6,
                        child: DefaultTextFormFieldWithoutLabel(
                          controller: birthDate,
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
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              OrganizationMembershipDataCubit.get(context).getNationalIDImageFromGallery();
                            },
                            child: Container(
                              height: 80,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(AppPaths.notationIdIconSvg),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text('قم برفع صورة بطاقة الرقم القومي' , style: Styles.textStyle9W400,textAlign: TextAlign.center,)
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
                              OrganizationMembershipDataCubit.get(context).getPersonalImageFromGallery();

                            },
                            child: Container(
                              height: 80,
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(AppPaths.imageIconSvg),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Text('قم برفع صورة لك' , style: Styles.textStyle9W400,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      OrganizationMembershipDataCubit.get(context).getOrganizationCardFromGallery ();
                    },
                    child: Container(
                      height: 85, padding: EdgeInsets.all(2),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppPaths.notationIdIconSvg),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text('قم برفع صورة كارنية العضوية للمؤسسة' , style: Styles.textStyle8W400,)
                          ],
                        ),
                      ),
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
