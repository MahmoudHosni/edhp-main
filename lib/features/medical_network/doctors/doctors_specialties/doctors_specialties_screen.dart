import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:flutter/material.dart';

class DoctorsSpecialtiesScreen extends StatelessWidget {
  const DoctorsSpecialtiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
        title: StringsManager.doctors,
        body: Column(
          children: [
            Text(
              StringsManager.doctorsSpecialties,
              style: Styles.textStyle195W500
                  .copyWith(color: AppColors.blackColor, fontSize: 20),
            ),
            CustomDropdown(
              hintText: 'Select job role',
              items: [Text('fdsjk', style: TextStyle(color: Colors.red),), 'kfggf', 'kfjg'],
              onChanged: (value) {
                print(value);
              },
            ),
            // DefaultTextButton(text: '', function: function)
          ],
        ));
  }
}
