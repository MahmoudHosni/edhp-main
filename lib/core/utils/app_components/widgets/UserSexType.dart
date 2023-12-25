import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';

class UserSexType extends StatelessWidget{
  List<GenderList>? genderList;
  String? genderSelectedValue;
  final Function callBack;

  UserSexType({required this.genderList,required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.boxesColor,
            ),
            child: DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration:  InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
              ),
              hint: const Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  'اختار جنسك',
                  style: Styles.textStyle14W400,
                ),
              ),
              items: genderList?.map((item) => DropdownMenuItem<String>(
                value: item.value,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                      item.value ??'',
                      style: Styles.textStyle14W400.copyWith(color: Colors.black)
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
                    color: Colors.grey
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
        ),
        const Expanded(flex: 1,child: Text('النوع' , style: Styles.textStyle14W400, textAlign: TextAlign.end,)),
      ],
    );
  }

}