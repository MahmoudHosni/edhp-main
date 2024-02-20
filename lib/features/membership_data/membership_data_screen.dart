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
import 'package:edhp/core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/membership_data/cubit/cubit.dart';
import 'package:edhp/features/membership_data/cubit/states.dart';
import 'package:edhp/features/membership_data/widgets/membership_text_form_field.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';

import 'widgets/custom_step_one_app_bar.dart';

class MembershipDataScreen extends StatefulWidget {
  final SubscriptionRequest subscriptionRequest;
  MembershipDataScreen({super.key,required this.subscriptionRequest});

  @override
  State<MembershipDataScreen> createState() => _MembershipDataScreenState();
}

class _MembershipDataScreenState extends State<MembershipDataScreen> {
  TextEditingController identityNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController notationIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController birthDateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? maritalStatusSelectedValue;
  MembershipDataCubit? cubit;
  int stateID=1;
  int gender = 1;
  List<City> cities = [];

  @override
  void initState() {
    super.initState();
    print("selected Membership :: ${widget.subscriptionRequest.MembershipTypeID}");
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
        return ViewContainer(title: StringsManager.memberShips,body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 11,),
                    const Text(StringsManager.individualMemberShip , style: Styles.textStyle15W500,),
                    SizedBox(height: 6,),
                    const Text(StringsManager.resumeMemberShipData , style: Styles.textStyle10W400,),
                    const SizedBox(
                      height: 25,
                    ),
                    MembershipTextFormField(maxLength: 14,error: identityNumberController.text.length==14?'':"",onSummit: (value) {
                      if(value!=null && value.length==14){
                        var analyser = DateAnaylser(date: value);
                        widget.subscriptionRequest.IdentityNumber = value;
                        birthDateController.text = analyser.getYear()+"/"+analyser.getMonth()+"/"+analyser.getDay();
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
                          birthDateController.text = analyser.getYear()+"/"+analyser.getMonth()+"/"+analyser.getDay();
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
                    const SizedBox(
                      height: 14,
                    ),
                    InputViewWithLabel(subview: GovernoratesView(states: cubit?.subscriptionInfoLookupsModel?.states,callBack: onSelectGovernorate,stateID: stateID),nameOfField: 'المحافظة',),
                    const SizedBox(height: 14,),
                    InputViewWithLabel(subview: GovernorateRegionsView(cities: cities,callBack: onSelectCity),nameOfField: 'المنطقة',),
                    const SizedBox(height: 10,),
                    MembershipTextFormField(maxLength: 100,error: addressController.text.length==14?'':"",
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
                      controller: addressController,
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
                            selectDate(context,birthDateController);
                          },
                          icon: SvgPicture.asset(AppPaths.dateIconSvg),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 12),alignment: Alignment.center,
                            child: DefaultTextFormFieldWithoutLabel(maxLen: 11,error: birthDateController.text.length>=7?'':"",
                              controller: birthDateController,
                              keyboardType: TextInputType.text,onChange: (value) {
                                print("onChange");
                                if(value != null && value.length>7) {
                                  setState(() {
                                    birthDateController.text = value;
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
                        ),
                      ],
                    ),nameOfField: 'تاريخ الميلاد',),
                    const SizedBox(height: 10,),
                    // Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                    InputViewWithLabel(subview:Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              selectDate(context,startDateController);
                            },
                            icon: SvgPicture.asset(AppPaths.dateIconSvg,width: 18),
                          ),
                          Expanded(
                            flex: 1,
                            child:  Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 12),alignment: Alignment.center,
                              child:DefaultTextFormFieldWithoutLabel(maxLen: 11,error: startDateController.text.length>=7?'':"",
                              controller: startDateController,
                              keyboardType: TextInputType.text,onChange: (value) {
                                print("onChange");
                                if(value != null && value.length>7) {
                                  setState(() {
                                    startDateController.text = value;
                                    widget.subscriptionRequest.SubscriptionStartDate = value;
                                  });
                                }else{
                                  ShowToast.showToast('برجاء ادخال تاريخ بدء الاشتراك بصورة صحيحة');
                                  return 'برجاء ادخال تاريخ بدء الاشتراك بصورة صحيحة';
                                }
                              },
                              validation: (value){
                                print("validation");
                              },
                              isClickable: false,
                            )),
                          ),
                        ],
                      ),nameOfField: 'بدء الاشتراك' ,),
                    const SizedBox(
                      height: 10,
                    ),
                    InputViewWithLabel(subview:Row(
                        children: [
                          IconButton(
                            onPressed: (){
                              selectDate(context,endDateController);
                            },
                            icon: SvgPicture.asset(AppPaths.dateIconSvg,width: 18,),
                          ),
                          Expanded(
                            flex: 1,
                            child:  Container(padding: EdgeInsets.fromLTRB(0, 0, 0, 12),alignment: Alignment.center,
                              child:DefaultTextFormFieldWithoutLabel(maxLen: 11,error: endDateController.text.length>=7?'':"",
                              controller: endDateController,
                              keyboardType: TextInputType.text,onChange: (value) {
                                print("onChange");
                                if(value != null && value.length>7) {
                                  setState(() {
                                    endDateController.text = value;
                                    widget.subscriptionRequest.SubscriptionEndDate = value;
                                  });
                                }else{
                                  ShowToast.showToast('برجاء ادخال تاريخ نهاية الاشتراك بصورة صحيحة');
                                  return 'برجاء ادخال تاريخ نهاية الاشتراك بصورة صحيحة';
                                }
                              },
                              validation: (value){
                                print("validation");
                              },
                              isClickable: false,
                            ),
                          )),
                        ],
                      ),nameOfField: 'نهاية الاشتراك',),
                    // ],),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                _showChoiceDialog(context, cubit!.getNotationIdImageFromGallery);
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
                                      cubit?.notationIdImage==null?
                                          SvgPicture.asset(AppPaths.personalIdIconSvg):
                                           ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12)),child: Image.file(cubit!.notationIdImage!,width: 65,height: 65,)) ,
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
                                _showChoiceDialog(context, cubit!.getProfileImageFromGallery);
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
                                        cubit?.profileImage==null?
                                        SvgPicture.asset(AppPaths.notationIdIconSvg):
                                        ClipRRect(borderRadius: BorderRadius.all(Radius.circular(12)),child: Image.file(cubit!.profileImage!,width: 65,height: 65,)) ,
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
                      height: 22,
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

  Future<void> selectDate(BuildContext context,TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 1),
        lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        String date = picked.year.toString() +" / "+picked.month.toString()+" / "+picked.day.toString();
        controller.text = date;
        if(controller == birthDateController) {
          widget.subscriptionRequest.BirthDate = date;
        }else if(controller == startDateController) {
          widget.subscriptionRequest.SubscriptionStartDate = date;
        }else if(controller == endDateController) {
          widget.subscriptionRequest.SubscriptionEndDate = date;
        }
      });
    }
  }

  void validateAndContinue() {
    if(widget.subscriptionRequest.IdentityNumber==null || ((widget.subscriptionRequest.IdentityNumber?.length??0)<14 || (widget.subscriptionRequest.IdentityNumber?.length??0)>14)){
      ShowToast.showToast('برجاء ادخال الرقم القومى بصورة صحيحة');
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
    }else if(widget.subscriptionRequest.SubscriptionStartDate==null || (widget.subscriptionRequest.SubscriptionStartDate?.length ??0) <=6){
      ShowToast.showToast('برجاء ادخال تاريخ بدء الاشتراك بصورة صحيحة');
      return ;
    }else if(widget.subscriptionRequest.SubscriptionEndDate==null || (widget.subscriptionRequest.SubscriptionEndDate?.length ??0) <=6){
      ShowToast.showToast('برجاء ادخال تاريخ نهاية الاشتراك بصورة صحيحة');
      return ;
    }else if(cubit?.profileImage == null || cubit?.profileImage?.path==null){
      ShowToast.showToast('برجاء اختيار صورة شخصية لك بصورة صحيحة');
      return ;
    }else if(cubit?.notationIdImage == null || cubit?.notationIdImage?.path==null){
      ShowToast.showToast('برجاء اختيار صورة الرقم القومى بصورة صحيحة');
      return ;
    } else {
      widget.subscriptionRequest.PersonalImage = cubit?.profileImage;
      widget.subscriptionRequest.NationalNumberImage = cubit?.notationIdImage;

      GoRouter.of(context).push(AppRouters.kServiceScreen,extra: widget.subscriptionRequest);
    };
  }

  void updateCities() {
    setState(() {
      cities  = cubit?.subscriptionInfoLookupsModel?.Cities?.where((element) => element.StateID == widget.subscriptionRequest?.StateID).toList() ??[];
      print(cities.length.toString());
    });
  }

  Future<void> _showChoiceDialog(BuildContext context,Function callBack)
  {
    return showDialog(context: context,builder: (BuildContext context){

      return AlertDialog(backgroundColor: Colors.blue,
        title: Text("اختر",style: TextStyle(color: Colors.white),),
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              Divider(height: 1,color: Colors.white,),
              ListTile(
                onTap: (){
                  callBack(ImageSource.gallery);
                  Navigator.pop(context);
                },
                title: Text("معرض الصور",style: Styles.textStyle13W500.copyWith(color: Colors.white),),
                leading: Icon(Icons.image,color: Colors.white,),
              ),

              Divider(height: 1,color: Colors.white,),
              ListTile(
                onTap: (){
                  callBack(ImageSource.camera);
                  Navigator.pop(context);
                },
                title: Text("الكاميرا",style: Styles.textStyle13W500.copyWith(color: Colors.white)),
                leading: Icon(Icons.camera,color: Colors.white,),
              ),
            ],
          ),
        ),);
    });
  }

  @override
  void dispose() {
    cubit?.profileImage=null;
    cubit?.notationIdImage=null;
    super.dispose();
  }
}
