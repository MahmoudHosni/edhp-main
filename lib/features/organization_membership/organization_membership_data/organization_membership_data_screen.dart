import 'package:edhp/core/utils/DateAnaylser.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/BackCircleButton.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernorateRegionsView.dart';
import 'package:edhp/core/utils/app_components/widgets/GovernoratesView.dart';
import 'package:edhp/core/utils/app_components/widgets/InputViewWithLabel.dart';
import 'package:edhp/core/utils/app_components/widgets/NextButton.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_components/widgets/UserSexType.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/membership_data/widgets/membership_text_form_field.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/cubit.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/states.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import '../../membership_data/widgets/custom_step_one_app_bar.dart';

class OrganizationMembershipDataScreen extends StatefulWidget {
  final SubscriptionRequest subscriptionRequest;

  OrganizationMembershipDataScreen({super.key,required this.subscriptionRequest});

  @override
  State<OrganizationMembershipDataScreen> createState() => _OrganizationMembershipDataScreenState();
}

class _OrganizationMembershipDataScreenState extends State<OrganizationMembershipDataScreen> {
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController membershipNumberController = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  String? genderSelectedValue;
  String ? governorateSelectedValue;
  String? maritalStatusSelectedValue;
  TextEditingController region = TextEditingController();
  TextEditingController address = TextEditingController();
  OrganizationMembershipDataCubit? cubit ;
  List<City> cities = [];
  int stateID = 1;
  int gender  = 1;

  @override
  void initState() {
    super.initState();
    cubit = OrganizationMembershipDataCubit.get(context);
    cubit?.getSubscriptionInfoLookUps();
    // birthDate.text = cubit?.selectedBirthDate != null ? '${cubit?.selectedBirthDate!.year} / ${cubit?.selectedBirthDate!.month} / ${cubit?.selectedBirthDate!.day}' : '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrganizationMembershipDataCubit, OrganizationMembershipDataStates>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return ViewContainer(title: StringsManager.memberShips,body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 11,),
                  const Text('بيانات عضوية الشركة' , style: Styles.textStyle16W500,),
                  const SizedBox(height: 20,),

                  MembershipTextFormField(maxLength: 14,error: identityNumberController.text.length==14?'':"",onSummit: (value) {
                    if(value!=null && value.length==14){
                        widget.subscriptionRequest.IdentityNumber = value;
                        var analyser = DateAnaylser(date: value);
                        birthDate.text = analyser.getYear()+"/"+analyser.getMonth()+"/"+analyser.getDay();
                        widget.subscriptionRequest.BirthDate = analyser.getYear()+"/"+analyser.getMonth()+"/"+analyser.getDay();
                        stateID = int.parse(analyser.getGovernorate());
                        print('State   ::: ${stateID}');
                        widget.subscriptionRequest.StateID = stateID;
                        gender = analyser.getGender();
                        print('Gender   ::: ${gender}');
                        widget.subscriptionRequest.Gender = gender;
                    }else{
                      ShowToast.showToast('برجاء ادخال الرقم القومى بصورة صحيحة');
                      return 'برجاء ادخال الرقم القومى بصورة صحيحة';
                    }
                    },
                    validation: (value){
                      widget.subscriptionRequest.IdentityNumber = value;
                      if(value!=null && value.length==14){
                        var analyser = DateAnaylser(date: value);
                        birthDate.text = analyser.getYear()+"/"+analyser.getMonth()+"/"+analyser.getDay();
                        widget.subscriptionRequest.BirthDate = analyser.getYear()+"/"+analyser.getMonth()+"/"+analyser.getDay();
                        stateID = int.parse(analyser.getGovernorate());
                        print('State   ::: ${stateID}');
                        widget.subscriptionRequest.StateID = stateID;
                        gender = analyser.getGender();
                        print('Gender   ::: ${gender}');
                        widget.subscriptionRequest.Gender = gender;
                        updateCities();
                      }
                    },
                    controller: identityNumberController,
                    textInputType: TextInputType.number,
                    nameOfField: 'الرقم القومي',
                  ),
                  const SizedBox(height: 10,),
                  MembershipTextFormField(maxLength: 15,error: membershipNumberController.text.length==14?'':"",
                    onSummit: (value) {
                      if(value!=null && value.length<3){
                        widget.subscriptionRequest.OrganizationMembershipNumber = value;
                      }else{
                        ShowToast.showToast('برجاء ادخال رقم العضوية بصورة صحيحة');
                        return 'برجاء ادخال رقم العضوية بصورة صحيحة';
                      }
                    },
                    validation: (value){
                      widget.subscriptionRequest.OrganizationMembershipNumber = value;
                    },
                    controller: membershipNumberController,
                    textInputType: TextInputType.text,
                    nameOfField: 'رقم العضوية',
                  ),
                  const SizedBox(height: 10,),
                  InputViewWithLabel(subview: GovernoratesView(states: cubit?.subscriptionInfoLookupsModel?.states,callBack: onSelectGovernorate,stateID: stateID),nameOfField: 'المحافظة',),
                  const SizedBox(
                    height: 10,
                  ),
                  InputViewWithLabel(subview: GovernorateRegionsView(cities: cities,callBack: onSelectCity),nameOfField: 'المنطقة',),
                  const SizedBox(
                    height: 10,
                  ),
                  MembershipTextFormField(maxLength: 100,error: address.text.length==14?'':"",
                    onSummit: (value) {
                      if(value!=null && (value?.length ??0) >20){
                        widget.subscriptionRequest.Address = value;
                      }else{
                        ShowToast.showToast('برجاء ادخال العنوان بشكل صحيح');
                        return 'برجاء ادخال العنوان بشكل صحيح';
                      }
                    },
                    validation: (value){
                      widget.subscriptionRequest.Address = value;
                    },
                    controller: address,
                    textInputType: TextInputType.text,
                    nameOfField: 'العنوان',
                  ),
                  const SizedBox(height: 10,),
                  InputViewWithLabel(subview: UserSexType(genderList: cubit?.subscriptionInfoLookupsModel?.genderList,callBack:onSelectGender,gender: gender),nameOfField: 'النوع',),
                  const SizedBox(height: 10,),

                  InputViewWithLabel(subview:Row(
                    children: [
                      IconButton(
                        onPressed: (){
                          selectDate(context,);
                        },
                        icon: SvgPicture.asset(AppPaths.dateIconSvg),
                      ),
                      Expanded(
                        flex: 6,
                        child: DefaultTextFormFieldWithoutLabel(maxLen: 11,error: birthDate.text.length>=7?'':"",
                          controller: birthDate,
                          keyboardType: TextInputType.text,onChange: (value) {
                            print("onChange");
                            if(value != null && value.length>7) {
                              setState(() {
                                birthDate.text = value;
                                widget.subscriptionRequest.BirthDate = value;
                              });
                            }else{
                              ShowToast.showToast('برجاء ادخال تاريخ الميلاد بصورة صحيحة');
                              return 'برجاء ادخال تاريخ الميلاد بصورة صحيحة';
                            }
                          },
                          validation: (value){
                            print("validation");
                          },
                          isClickable: false,
                        ),
                      ),
                    ],
                  ),nameOfField: 'تاريخ الميلاد',),
                  const SizedBox(height: 16,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){
                              cubit?.getNationalIDImageFromGallery();
                            },
                            child:Container(height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),border: Border.all(color: AppColors.cardBorderNew),
                                color:  AppColors.cardNew,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    cubit?.nationalIdImage==null?
                                    SvgPicture.asset(AppPaths.personalIdIconSvg):
                                    ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12)),child: Image.file(cubit!.nationalIdImage!,width: 65,height: 65,)) ,
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Expanded(child: const Text('ارفق البطاقة الشخصية' , style: Styles.textStyle8W500,textAlign: TextAlign.end,))
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
                            onTap: (){
                              cubit?.getPersonalImageFromGallery();
                            },
                            child: Container(height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),border: Border.all(color: AppColors.cardBorderNew),
                                color:  AppColors.cardNew,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      cubit?.personalImage==null?
                                      SvgPicture.asset(AppPaths.notationIdIconSvg):
                                      ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12)),child: Image.file(cubit!.personalImage!,width: 65,height: 65,)) ,
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Expanded(child: const Text('ارفق صورة لك' , style: Styles.textStyle8W500,textAlign: TextAlign.end,))
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
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      cubit?.getOrganizationCardFromGallery();
                    },
                    child: Container(height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),border: Border.all(color: AppColors.cardBorderNew),
                        color:  AppColors.cardNew,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Row(mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 8,
                              ),
                              cubit?.orgCardImage==null?
                              SvgPicture.asset(AppPaths.notationIdIconSvg):
                              ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12)),child: Image.file(cubit!.orgCardImage!,width: 65,height: 65,)) ,
                              const SizedBox(
                                height: 5,
                              ),
                              Expanded(child: const Text('قم برفع صورة كارنية العضوية للمؤسسة'  , style: Styles.textStyle8W500,textAlign: TextAlign.end,))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(children:[
                    Container(alignment: Alignment.bottomLeft,
                      child: NextButton(function: (){
                        validateAndContinue();
                      }, text: StringsManager.select , height: 45,width: 120,),),
                    const SizedBox(width: 8,),
                    Container(width: 35,height:35,child: BackCircleButton(),),
                  ],),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
      );
    },
);
  }

  onSelectGovernorate(String name) {
    widget.subscriptionRequest.StateID = cubit?.subscriptionInfoLookupsModel?.states?[cubit?.subscriptionInfoLookupsModel?.states?.indexWhere((element) => element.name==name) ??0].iD ??0;
    updateCities();
  }

  onSelectCity(String name) {
    widget.subscriptionRequest.CityID = cubit?.subscriptionInfoLookupsModel?.Cities?[cubit?.subscriptionInfoLookupsModel?.Cities?.indexWhere((element) => element.name==name) ??0].iD ??0;
  }

  onSelectGender(String name){
    widget.subscriptionRequest.Gender = (name.toLowerCase() == 'male' || name.toLowerCase() == 'ذكر')? 1 :2 ;
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
        String date = picked.year.toString() +" / "+picked.month.toString()+" / "+picked.day.toString();
        birthDate.text = date;
        widget.subscriptionRequest.BirthDate = date;
      });
    }
  }

  void validateAndContinue() {
      if(widget.subscriptionRequest.IdentityNumber==null || ((widget.subscriptionRequest.IdentityNumber?.length??0)<14 || (widget.subscriptionRequest.IdentityNumber?.length??0)>14)){
        ShowToast.showToast('برجاء ادخال الرقم القومى بصورة صحيحة');
        return ;
      }
      else if(widget.subscriptionRequest.OrganizationMembershipNumber==null || ((widget.subscriptionRequest.OrganizationMembershipNumber?.length??0)<3 || (widget.subscriptionRequest.OrganizationMembershipNumber?.length??0)>15)){
        ShowToast.showToast('برجاء ادخال رقم العضوية بصورة صحيحة');
        return ;
      }
      else if(widget.subscriptionRequest.StateID==null || (widget.subscriptionRequest.StateID??0) <0){
        ShowToast.showToast('برجاء اختيار المحافظة بصورة صحيحة');
        return ;
      }
      else if(widget.subscriptionRequest.CityID==null || (widget.subscriptionRequest.CityID??0) <0){
        ShowToast.showToast('برجاء اختيار المنطقة بصورة صحيحة');
        return ;
      }
      else if(widget.subscriptionRequest.Address==null || (widget.subscriptionRequest.Address?.length ??0) <10){
        ShowToast.showToast('برجاء ادخال العنوان بصورة صحيحة');
        return ;
      }
      else if(widget.subscriptionRequest.Gender==null || (widget.subscriptionRequest.Gender ??0) <0){
        ShowToast.showToast('برجاء اختيار النوع بصورة صحيحة');
        return ;
      }else if(widget.subscriptionRequest.BirthDate==null || (widget.subscriptionRequest.BirthDate?.length ??0) <=6){
        ShowToast.showToast('برجاء ادخال تاريخ الميلاد بصورة صحيحة');
        return ;
      }else if(cubit?.personalImage == null || cubit?.personalImage?.path==null){
        ShowToast.showToast('برجاء اختيار صورة شخصية لك بصورة صحيحة');
        return ;
      }else if(cubit?.nationalIdImage == null || cubit?.nationalIdImage?.path==null){
        ShowToast.showToast('برجاء اختيار صورة الرقم القومى بصورة صحيحة');
        return ;
      }else if(cubit?.orgCardImage == null || cubit?.orgCardImage?.path==null){
        ShowToast.showToast('برجاء اختيار صورة كارت العضوية للمؤسسة بصورة صحيحة');
        return ;
      } else {
        widget.subscriptionRequest.PersonalImage = cubit?.personalImage;
        widget.subscriptionRequest.NationalNumberImage = cubit?.nationalIdImage;
        widget.subscriptionRequest.OrganizationMembershipNumberImage = cubit?.orgCardImage;

        // OrganizationMembershipDataCubit.get(context).requestSubscription(widget.subscriptionRequest);
        GoRouter.of(context).push(AppRouters.kServiceScreen,extra: widget.subscriptionRequest);
      };
  }

  void updateCities() {
    setState(() {
      cities  = cubit?.subscriptionInfoLookupsModel?.Cities?.where((element) => element.StateID == widget.subscriptionRequest?.StateID).toList() ??[];
      print(cities.length.toString());
    });
  }
}
