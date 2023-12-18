import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_components/widgets/default_text_form_filed_without_label.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:flutter/material.dart';

import '../../core/utils/styles/styles.dart';

class MedicalRecordScreen extends StatelessWidget {
  MedicalRecordScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController notationIdController = TextEditingController();
  TextEditingController bloodTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24.0),
                  child: Center(child: Text('السجل المرضي' , style: Styles.textStyle20W500,)),
                ),
                Center(
                  child: Container(
                    width: 125,
                    height: 125,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(AppPaths.image, fit: BoxFit.cover,),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Center(child: Text('1248796Hc' , style: Styles.textStyle16W400,)),
                SizedBox(
                  height: 20,
                ),
                const Text('الإسم' , style: Styles.textStyle16W500,),
                const SizedBox(
                  height: 5,
                ),
                DefaultTextFormFieldWithoutLabel(controller: nameController, keyboardType: TextInputType.name, validation: (value){},),
                const SizedBox(
                  height: 10,
                ),
                const Text('رقم الهاتف' , style: Styles.textStyle16W500,),
                const SizedBox(
                  height: 5,
                ),
                DefaultTextFormFieldWithoutLabel(controller: phoneNumberController, keyboardType: TextInputType.number, validation: (value){},),
                const SizedBox(
                  height: 10,
                ),
                const Text('النوع' , style: Styles.textStyle16W500,),
                const SizedBox(
                  height: 5,
                ),
                DefaultTextFormFieldWithoutLabel(controller: genderController, keyboardType: TextInputType.text, validation: (value){},),
                const SizedBox(
                  height: 10,
                ),
                const Text('الرقم القومي' , style: Styles.textStyle16W500,),
                const SizedBox(
                  height: 5,
                ),
                DefaultTextFormFieldWithoutLabel(controller: notationIdController, keyboardType: TextInputType.number, validation: (value){},),
                const SizedBox(
                  height: 10,
                ),
                const Text('فصيلة الدم' , style: Styles.textStyle16W500,),
                const SizedBox(
                  height: 5,
                ),
                DefaultTextFormFieldWithoutLabel(controller: bloodTypeController, keyboardType: TextInputType.text, validation: (value){},),
                const SizedBox(
                  height: 20,
                ),
                DefaultButton(function: (){}, text: 'حفظ التعديلات',),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
