import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/DateAnaylser.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/Utilites.dart';
import 'package:edhp/core/utils/app_components/widgets/ChoiceImageDialog.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernorateRegionsView.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernoratesView.dart';
import 'package:edhp/core/utils/app_components/widgets/InputViewWithLabel.dart';
import 'package:edhp/core/utils/app_components/widgets/RelationTypeView.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_components/widgets/UserSexType.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/relatives/add/AddRelativesCubit.dart';
import 'package:edhp/features/relatives/add/RelativesStates.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_components/widgets/default_button.dart';
import '../../../core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import 'dart:ui' as ui;
import '../../../core/utils/app_paths.dart';
import '../../../core/utils/styles/styles.dart';
import '../../individual_membership_data/widgets/membership_text_form_field.dart';

class AddRelativesScreen extends StatefulWidget {
  final SubscriptionRequest subscribtionRequest;
  const AddRelativesScreen({super.key, required this.subscribtionRequest});

  @override
  State<AddRelativesScreen> createState() => _AddRelativesScreenState();
}

class _AddRelativesScreenState extends State<AddRelativesScreen> {
  int stateID = 1;
  int gender = 1;
  int rl=1;
  TextEditingController arabicNameController = TextEditingController();
  TextEditingController englishNameController = TextEditingController();
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
  AddRelativesCubit? cubit;
  String? maritalStatusSelectedValue;

  @override
  void initState() {
    super.initState();
    cubit = AddRelativesCubit.get(context);
    cubit?.getSubscriptionInfoLookUps();
    widget.subscribtionRequest.RelationTypeID = 1;
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

                    MembershipTextFormField(maxLength: 100,error: arabicNameController.text.length==14?'':"",onSummit: (value) {
                        validateName(value ??"","ar");
                      },
                      validation: (value){
                         widget.subscribtionRequest.ArabicName = value ??"";
                      },
                      controller: arabicNameController,
                      textInputType: TextInputType.text,
                      nameOfField: 'الاسم',
                    ),

                    MembershipTextFormField(maxLength: 100,error: englishNameController.text.length==14?'':"",onSummit: (value) {
                      validateName(value ??"","en");
                    },
                      validation: (value){
                        widget.subscribtionRequest.EnglishName = value ??"";
                      },
                      controller: englishNameController,
                      textInputType: TextInputType.text,
                      nameOfField: 'Name',
                    ),

                    MembershipTextFormField(
                      maxLength: 100,
                      error: addressController.text.length == 14 ? '' : "",
                      onSummit: (value) {
                        if (value != null && (value?.length ?? 0) > 10) {
                          widget.subscribtionRequest.Address = value;
                        } else {
                          ShowToast.showToast('برجاء ادخال العنوان بشكل صحيح');
                          return 'برجاء ادخال العنوان بشكل صحيح';
                        }
                      },
                      validation: (value) {
                        widget.subscribtionRequest.Address = value;
                      },
                      controller: addressController,
                      textInputType: TextInputType.text,
                      nameOfField: 'العنوان',
                    ),
                    Padding(
                      padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 20),
                      child: Directionality(
                        textDirection:  ui.TextDirection.ltr ,
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            labelText: StringsManager.phoneNumber,
                            labelStyle: Styles.textStyle14W500
                                .copyWith(color: AppColors.lightGrayColor),
                            fillColor: Colors.white,
                          ),
                          initialCountryCode: 'EG',
                          pickerDialogStyle: PickerDialogStyle(
                              backgroundColor: Colors.white,
                              countryCodeStyle: const TextStyle(color: Colors.blue),
                              countryNameStyle: const TextStyle(color: Colors.black)),
                          onChanged: (phone) {
                            phoneNumberController.text = phone.completeNumber;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    MembershipTextFormField(
                      maxLength: 14,
                      error: notationIdController.text.length == 14 ? '' : "",
                      onSummit: (value) {
                        if (value != null && value.length == 14) {
                          widget.subscribtionRequest.IdentityNumber = value;
                          var analyser = DateAnaylser(date: value);
                          birthDateController.text = "${analyser.getYear()}/${analyser.getMonth()}/${analyser.getDay()}";
                          widget.subscribtionRequest.BirthDate = "${analyser.getYear()}/${analyser.getMonth()}/${analyser.getDay()}";
                          stateID = int.parse(analyser.getGovernorate());
                          print('State   ::: ${stateID}');
                          widget.subscribtionRequest.StateID = stateID;
                          gender = analyser.getGender();
                          print('Gender   ::: ${gender}');
                          widget.subscribtionRequest.Gender = gender;
                        } else {
                          ShowToast.showToast(
                              'برجاء ادخال الرقم القومى بصورة صحيحة');
                          return 'برجاء ادخال الرقم القومى بصورة صحيحة';
                        }
                      },
                      validation: (value) {
                        widget.subscribtionRequest.IdentityNumber = value;
                        if (value != null && value.length == 14) {
                          var analyser = DateAnaylser(date: value);
                          birthDateController.text = "${analyser.getYear()}/${analyser.getMonth()}/${analyser.getDay()}";
                          widget.subscribtionRequest.BirthDate = "${analyser.getYear()}/${analyser.getMonth()}/${analyser.getDay()}";
                          stateID = int.parse(analyser.getGovernorate());
                          print('State   ::: ${stateID}');
                          widget.subscribtionRequest.StateID = stateID;
                          gender = analyser.getGender();
                          print('Gender   ::: ${gender}');
                          widget.subscribtionRequest.Gender = gender;
                          updateCities();
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
                                    widget.subscribtionRequest.BirthDate = value;
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
                              onTap: (){
                                  ChoiceImageDialog().getImageDialog(context,cubit!.getNotationIdImageFromGallery);
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
                                      getImage(cubit?.nationalIdImage,AppPaths.personalIdIconSvg),
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
                                ChoiceImageDialog().getImageDialog(context,cubit!.getProfileImageFromGallery);
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
                                      getImage(cubit?.profileImage,AppPaths.notationIdIconSvg),
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
                        validateAndRegister();
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
        widget.subscribtionRequest.BirthDate = date;
      });
    }
  }

  onSelectGender(String name) {
    widget.subscribtionRequest.Gender = (name.toLowerCase() == 'male' || name.toLowerCase() == 'ذكر') ? 1 : 2;
  }

  onSelectGovernorate(String name) {
    widget.subscribtionRequest.StateID = cubit
        ?.subscriptionInfoLookupsModel
        ?.states?[cubit?.subscriptionInfoLookupsModel?.states
        ?.indexWhere((element) => element.name == name) ??
        0]
        .iD ??
        0;
    updateCities();
  }

  onSelectCity(String name) {
    widget.subscribtionRequest.CityID = cubit
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
      element.StateID == widget.subscribtionRequest?.StateID)
          .toList() ??
          [];
      print(cities.length.toString());
    });
  }

  onSelectRelation(String name) {
    rl = cubit?.relations[ cubit?.relations?.indexWhere((element) => element.value == name) ?? 0].key ?? 0;
    widget.subscribtionRequest.RelationTypeID = rl;
  }

   validateName(String value,String lang) {
    if ((value.length ?? 0) > 10) {
      if(lang=="ar") {
        widget.subscribtionRequest.ArabicName = value;
      } else {
        widget.subscribtionRequest.EnglishName = value;
      }
    } else {
      ShowToast.showToast('برجاء ادخال الاسم بشكل صحيح');
      return 'برجاء ادخال الاسم بشكل صحيح';
    }
  }

  void validateAndRegister() {
    if (widget.subscribtionRequest.ArabicName == null ||
        (widget.subscribtionRequest.ArabicName?.length ?? 0) < 10) {
      ShowToast.showToast('برجاء ادخال الاسم بصورة صحيحة');
      return;
    }else if (widget.subscribtionRequest.EnglishName == null ||
        (widget.subscribtionRequest.EnglishName?.length ?? 0) < 10) {
      ShowToast.showToast('برجاء ادخال الاسم الانجليزى بصورة صحيحة');
      return;
    }else if (widget.subscribtionRequest.Address == null ||
        (widget.subscribtionRequest.Address?.length ?? 0) < 10) {
      ShowToast.showToast('برجاء ادخال العنوان بصورة صحيحة');
      return;
    }

    else if (widget.subscribtionRequest.IdentityNumber == null ||
        ((widget.subscribtionRequest.IdentityNumber?.length ?? 0) < 14 ||
            (widget.subscribtionRequest.IdentityNumber?.length ?? 0) > 14)) {
      ShowToast.showToast('برجاء ادخال الرقم القومى بصورة صحيحة');
      return;
    } else if (widget.subscribtionRequest.StateID == null ||
        (widget.subscribtionRequest.StateID ?? 0) < 0) {
      ShowToast.showToast('برجاء اختيار المحافظة بصورة صحيحة');
      return;
    } else if (widget.subscribtionRequest.CityID == null ||
        (widget.subscribtionRequest.CityID ?? 0) < 0) {
      ShowToast.showToast('برجاء اختيار المنطقة بصورة صحيحة');
      return;
    }  else if (widget.subscribtionRequest.Gender == null ||
        (widget.subscribtionRequest.Gender ?? 0) < 0) {
      ShowToast.showToast('برجاء اختيار النوع بصورة صحيحة');
      return;
    } else if (widget.subscribtionRequest.BirthDate == null ||
        (widget.subscribtionRequest.BirthDate?.length ?? 0) <= 6) {
      ShowToast.showToast('برجاء ادخال تاريخ الميلاد بصورة صحيحة');
      return;
    }else if (cubit?.nationalIdImage == null ||
        cubit?.nationalIdImage?.path == null) {
      ShowToast.showToast('برجاء اختيار صورة الرقم القومى بصورة صحيحة');
      return;
    } else if (cubit?.profileImage == null ||
        cubit?.profileImage?.path == null) {
      ShowToast.showToast('برجاء اختيار صورة لك بصورة صحيحة');
      return;
    }else{
      // widget.subscribtionWithMembership.subscriptionRequest.MedicalCompanyID = (widget.subscribtionWithMembership.memberships[0]).MedicalCompanyID;
      // widget.subscribtionWithMembership.subscriptionRequest.OrganizationID = (widget.subscribtionWithMembership.memberships[0]).OrganizationID;
      // widget.subscribtionWithMembership.subscriptionRequest.OrganizationName = (widget.subscribtionWithMembership.memberships[0]).OrganizationName;
      // widget.subscribtionWithMembership.subscriptionRequest.OrganizationMembershipNumber = (widget.subscribtionWithMembership.memberships[0]).OrganizationMembershipNumber;
      // widget.subscribtionWithMembership.subscriptionRequest.MedicalCompanyName = (widget.subscribtionWithMembership.memberships[0]).MedicalCompanyName;
      widget.subscribtionRequest.SubscriptionTypeID = (widget.subscribtionRequest).SubscriptionTypeID;
      widget.subscribtionRequest.isRelativeRequest = true;

      widget.subscribtionRequest.MobileNumber = phoneNumberController.text;
      widget.subscribtionRequest.SubscriptionStartDate = getStartDate();
      widget.subscribtionRequest.SubscriptionEndDate = getEndDate();

      widget.subscribtionRequest.PersonalImage = cubit?.profileImage;
      widget.subscribtionRequest.NationalNumberImage = cubit?.nationalIdImage;
      widget.subscribtionRequest.OrganizationMembershipNumberImage = cubit?.nationalIdImage;
      GoRouter.of(context).push(AppRouters.kConfirmMembershipDataScreen, extra: widget.subscribtionRequest);
    }
  }

  Widget getImage(File? file, String iconSvg) {
    return file == null ?
              SvgPicture.asset(AppPaths.notationIdIconSvg) :
              ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.file(file!, width: 65, height: 65,));
  }
}