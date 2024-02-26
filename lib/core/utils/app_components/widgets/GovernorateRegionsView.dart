import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';

class GovernorateRegionsView extends StatelessWidget {
  List<City>? cities;
  final Function callBack;

  GovernorateRegionsView({required this.cities, required this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          border: InputBorder.none,
        ),
        hint: const Text(
          'اختار المنطقة',
          style: Styles.textStyle14W400,
        ),
        items: cities
            ?.map((item) => DropdownMenuItem<String>(
                  value: item.name,
                  child: Text(item.name ?? '',
                      style:
                          Styles.textStyle16W500.copyWith(color: Colors.black)),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'من فضلك اختر المنطقة';
          } else {
            callBack(value);
          }
          return null;
        },
        onChanged: (value) {
          callBack(value);
        },
        onSaved: (value) {
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
