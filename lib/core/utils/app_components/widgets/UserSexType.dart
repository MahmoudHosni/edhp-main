import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';

class UserSexType extends StatelessWidget{
  List<GenderList>? genderList;
  String? genderSelectedValue;
  final Function callBack;
  int gender;

  UserSexType({required this.genderList,required this.callBack,required this.gender});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 40,
            child: DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration:  InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
              ),
              hint:  Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  genderList?.firstWhere((element) => element?.key==gender).value ??'',
                  style: Styles.textStyle14W400,
                ),
              ),
              items: genderList?.map((item) => DropdownMenuItem<String>(
                value: item.value,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                      item.value ??'',
                      style: Styles.textStyle16W500.copyWith(color: Colors.black)
                  ),
                ),
              ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'من فضلك اختر نوع جنسك';
                }else{
                  callBack(value);
                }
                return null;
              },
              onChanged: (value) {
                callBack(value);
              },
              onSaved: (value) {
                genderSelectedValue = value.toString();
                callBack(value);
              },
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          );
  }

}