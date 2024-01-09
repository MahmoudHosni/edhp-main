import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';

class GovernoratesView extends StatelessWidget{
  List<States>? states;
  final Function callBack;
  int stateID;

  GovernoratesView({required this.states,required this.callBack,required this.stateID});

  @override
  Widget build(BuildContext context) {
    return  Container(
            height: 40,
            child: DropdownButtonFormField2<String>(
              isExpanded: true,
              decoration:  const InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
              ),
              hint:  Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  states?.firstWhere((element) => element?.iD==stateID).name ??'',
                  style: Styles.textStyle14W400,
                ),
              ),
              items: states?.map((item) => DropdownMenuItem<String>(
                value: item.name,
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                      item.name ??'' ,
                      style: Styles.textStyle14W400.copyWith(color: Colors.black)
                  ),
                ),
              ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'من فضلك اختر المدينة';
                }else{
                  callBack(value);
                }
                return null;
              },
              onChanged: (value) {
                callBack(value);
              },
              onSaved: (value) {

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
          );
  }

}