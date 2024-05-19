import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';

class RelationTypeView extends StatelessWidget{
  List<RelationType>? relationLst;
  String? relationSelectedValue;
  final Function callBack;
  int rel;

  RelationTypeView(
      {required this.relationLst, required this.callBack, required this.rel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          border: InputBorder.none,
        ),
        hint: Text(
          relationLst?.firstWhere((element) => element?.key == rel).value ??
              '',
          style: Styles.textStyle14W400,
        ),
        items: relationLst
            ?.map((item) => DropdownMenuItem<String>(
          value: item.value,
          child: Text(item.value ?? '',
              style:
              Styles.textStyle16W500.copyWith(color: Colors.black)),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'من فضلك اختر نوع جنسك';
          } else {
            callBack(value);
          }
          return null;
        },
        onChanged: (value) {
          callBack(value);
        },
        onSaved: (value) {
          relationSelectedValue = value.toString();
          callBack(value);
        },
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}