import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/DateAnaylser.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernorateRegionsView.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernoratesView.dart';
import 'package:edhp/core/utils/app_components/widgets/InputViewWithLabel.dart';
import 'package:edhp/core/utils/app_components/widgets/RelationTypeView.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_components/widgets/UserSexType.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/features/add_relatives/AddRelativesCubit.dart';
import 'package:edhp/features/add_relatives/RelativesStates.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_components/widgets/default_button.dart';
import '../../core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import '../../core/utils/app_paths.dart';
import '../../core/utils/styles/styles.dart';
import '../membership_data/widgets/membership_text_form_field.dart';

class AddRelativesScreen extends StatefulWidget {
  final SubscriptionRequest subscriptionRequest;
  AddRelativesScreen({super.key, required this.subscriptionRequest});

  @override
  State<AddRelativesScreen> createState() => _AddRelativesScreenState();
}

class _AddRelativesScreenState extends State<AddRelativesScreen> {
  int stateID = 1;
  int gender = 1;
  int rl=1;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController notationIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController primaryMemberController = TextEditingController();
  TextEditingController memberNumberController = TextEditingController();
  TextEditingController governorateController = TextEditingController();
  List<City> cities = [];
  String? membershipSelectedValue;
  String? genderSelectedValue;

  final maritalStatusItem = [
    'أعزب',
    'متزوج',
    'مطلق',
    'ارمل',
  ];
  AddRelativesCubit? cubit;
  String? maritalStatusSelectedValue;

  @override
  void initState() {
    super.initState();
    cubit = AddRelativesCubit.get(context);
    cubit?.getSubscriptionInfoLookUps();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddRelativesCubit, RelativeDataStates>(
        listener: (context, state) {

    },
    builder: (context, state) {
    return ViewContainer(
        title: StringsManager.add_relatives.tr(),
        body:  SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),

                    MembershipTextFormField(maxLength: 100,error: nameController.text.length==14?'':"",onSummit: (value) {

                    },
                      validation: (value){

                      },
                      controller: nameController,
                      textInputType: TextInputType.text,
                      nameOfField: 'الاسم',
                    ),

                    MembershipTextFormField(maxLength: 100,error: nameController.text.length==14?'':"",onSummit: (value) {

                    },
                      validation: (value){

                      },
                      controller: nameController,
                      textInputType: TextInputType.text,
                      nameOfField: 'Name',
                    ),

                    MembershipTextFormField(
                      maxLength: 100,
                      error: addressController.text.length == 14 ? '' : "",
                      onSummit: (value) {
                        if (value != null && (value?.length ?? 0) > 10) {
                          widget.subscriptionRequest.Address = value;
                        } else {
                          ShowToast.showToast('برجاء ادخال العنوان بشكل صحيح');
                          return 'برجاء ادخال العنوان بشكل صحيح';
                        }
                      },
                      validation: (value) {
                        widget.subscriptionRequest.Address = value;
                      },
                      controller: addressController,
                      textInputType: TextInputType.text,
                      nameOfField: 'العنوان',
                    ),
                    MembershipTextFormField(maxLength: 100,error: phoneNumberController.text.length==14?'':"",onSummit: (value) {

                    },
                      validation: (value){

                      },
                      controller: phoneNumberController,
                      textInputType: TextInputType.number,
                      nameOfField: 'رقم الهاتف',
                    ),

                    const SizedBox(
                      height: 4,
                    ),
                    MembershipTextFormField(maxLength: 100,error: passwordController.text.length==14?'':"",onSummit: (value) {

                    },
                      validation: (value){

                      },
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      nameOfField: 'الرقم السري',
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    MembershipTextFormField(
                      maxLength: 14,
                      error: notationIdController.text.length == 14 ? '' : "",
                      onSummit: (value) {
                        if (value != null && value.length == 14) {
                          widget.subscriptionRequest.IdentityNumber = value;
                          var analyser = DateAnaylser(date: value);
                          birthDateController.text = "${analyser.getYear()}/${analyser.getMonth()}/${analyser.getDay()}";
                          widget.subscriptionRequest.BirthDate = "${analyser.getYear()}/${analyser.getMonth()}/${analyser.getDay()}";
                          stateID = int.parse(analyser.getGovernorate());
                          print('State   ::: ${stateID}');
                          widget.subscriptionRequest.StateID = stateID;
                          gender = analyser.getGender();
                          print('Gender   ::: ${gender}');
                          widget.subscriptionRequest.Gender = gender;
                        } else {
                          ShowToast.showToast(
                              'برجاء ادخال الرقم القومى بصورة صحيحة');
                          return 'برجاء ادخال الرقم القومى بصورة صحيحة';
                        }
                      },
                      validation: (value) {
                        widget.subscriptionRequest.IdentityNumber = value;
                        if (value != null && value.length == 14) {
                          var analyser = DateAnaylser(date: value);
                          birthDateController.text = "${analyser.getYear()}/${analyser.getMonth()}/${analyser.getDay()}";
                          widget.subscriptionRequest.BirthDate = "${analyser.getYear()}/${analyser.getMonth()}/${analyser.getDay()}";
                          stateID = int.parse(analyser.getGovernorate());
                          print('State   ::: ${stateID}');
                          widget.subscriptionRequest.StateID = stateID;
                          gender = analyser.getGender();
                          print('Gender   ::: ${gender}');
                          widget.subscriptionRequest.Gender = gender;
                          // updateCities();
                        }
                      },
                      controller: notationIdController,
                      textInputType: TextInputType.number,
                      nameOfField: 'الرقم القومي',
                    ),
                    InputViewWithLabel(
                      subview: GovernoratesView(
                          states: cubit?.subscriptionInfoLookupsModel?.states,
                          callBack: onSelectGovernorate,
                          stateID: stateID),
                      nameOfField: 'المحافظة',
                    ),
                    InputViewWithLabel(
                      subview: GovernorateRegionsView(
                          cities: cities, callBack: onSelectCity),
                      nameOfField: 'المنطقة',
                    ),

                    InputViewWithLabel(
                      subview: UserSexType(
                          genderList:
                          cubit?.subscriptionInfoLookupsModel?.genderList,
                          callBack: onSelectGender,
                          gender: gender),
                      nameOfField: 'النوع',
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    InputViewWithLabel(
                      subview: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: DefaultTextFormFieldWithoutLabel(
                              maxLen: 11,
                              error: birthDateController.text.length >= 7 ? '' : "",
                              controller: birthDateController,
                              keyboardType: TextInputType.text,
                              onChange: (value) {
                                print("onChange");
                                if (value != null && value.length > 7) {
                                  setState(() {
                                    birthDateController.text = value;
                                    widget.subscriptionRequest.BirthDate = value;
                                  });
                                } else {
                                  ShowToast.showToast(
                                      'برجاء ادخال تاريخ الميلاد بصورة صحيحة');
                                  return 'برجاء ادخال تاريخ الميلاد بصورة صحيحة';
                                }
                              },
                              validation: (value) {
                                print("validation");
                              },
                              isClickable: false,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              selectDate(
                                context,
                              );
                            },
                            icon: SvgPicture.asset(AppPaths.dateIconSvg),
                          ),
                        ],
                      ),
                      nameOfField: 'تاريخ الميلاد',
                    ),
                    const SizedBox(
                      height: 4,
                    ),

                    InputViewWithLabel(
                      subview: RelationTypeView(
                          relationLst: cubit?.relations,
                          callBack: onSelectRelation,
                          rel: rl),
                      nameOfField: 'الحالة الإجتماعية',
                    ),


                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(2, 8, 2, 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // _showChoiceDialog(
                                //   context,
                                //   cubit!.getNationalIDImageFromGallery,
                                // );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border:
                                  Border.all(color: AppColors.cardBorderNew),
                                  color: AppColors.cardNew,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.symmetric(
                                      horizontal: 8),
                                  child: Row(
                                    children: [
                                      const Expanded(
                                          child: Text(
                                            'ارفق البطاقة الشخصية',
                                            style: Styles.textStyle8W500,
                                          )),
                                      // cubit?.nationalIdImage == null?
                                        SvgPicture.asset(
                                          AppPaths.personalIdIconSvg)
                                          // : ClipRRect(
                                          // borderRadius: BorderRadius.all(
                                          //     Radius.circular(12)),
                                          // child: Image.file(
                                          //   cubit!.nationalIdImage!,
                                          //   width: 65,
                                          //   height: 65,
                                          // )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                // _showChoiceDialog(
                                //   context,
                                //   cubit!.getPersonalImageFromGallery,
                                // );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  border:
                                  Border.all(color: AppColors.cardBorderNew),
                                  color: AppColors.cardNew,
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.symmetric(
                                      horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const Expanded(
                                          child: Text(
                                            'ارفق صورة لك',
                                            style: Styles.textStyle8W500,
                                          )),
                                      // cubit?.personalImage == null ?
                                        SvgPicture.asset(
                                            AppPaths.notationIdIconSvg)
                                            // :
                                          // ClipRRect(
                                          //   borderRadius: BorderRadius.all(
                                          //       Radius.circular(12)),
                                          //   child: Image.file(
                                          //     cubit!.personalImage!,
                                          //     width: 65,
                                          //     height: 65,
                                          //   )),
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
                      height: 30,
                    ),
                    DefaultButton(
                      function: (){

                      },
                      text: 'تسجيل' ,
                      height: 45,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),));
    });
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1970, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        String date = "${picked.year} / ${picked.month} / ${picked.day}";
        birthDateController.text = date;
        widget.subscriptionRequest.BirthDate = date;
      });
    }
  }

  onSelectGender(String name) {
    widget.subscriptionRequest.Gender = (name.toLowerCase() == 'male' || name.toLowerCase() == 'ذكر') ? 1 : 2;
  }

  onSelectGovernorate(String name) {
    widget.subscriptionRequest.StateID = cubit
        ?.subscriptionInfoLookupsModel
        ?.states?[cubit?.subscriptionInfoLookupsModel?.states
        ?.indexWhere((element) => element.name == name) ??
        0]
        .iD ??
        0;
    updateCities();
  }

  onSelectCity(String name) {
    widget.subscriptionRequest.CityID = cubit
        ?.subscriptionInfoLookupsModel
        ?.Cities?[cubit?.subscriptionInfoLookupsModel?.Cities
        ?.indexWhere((element) => element.name == name) ??
        0]
        .iD ??
        0;
  }

  void updateCities() {
    setState(() {
      cities = cubit?.subscriptionInfoLookupsModel?.Cities
          ?.where((element) =>
      element.StateID == widget.subscriptionRequest?.StateID)
          .toList() ??
          [];
      print(cities.length.toString());
    });
  }

  onSelectRelation(String name) {
    rl = cubit?.relations[ cubit?.relations?.indexWhere((element) => element.value == name) ?? 0].key ?? 0;
  }
}
