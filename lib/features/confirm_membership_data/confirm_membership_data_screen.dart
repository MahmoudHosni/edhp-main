import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/confirm_membership_data/widgets/custom_step_two_app_bar.dart';
import 'package:edhp/features/confirm_membership_data/widgets/terms_and_conditions_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/app_paths.dart';
import '../../core/utils/styles/styles.dart';
import 'widgets/confirm_data_field_and_value_item.dart';

class ConfirmMembershipDataScreen extends StatelessWidget {
  const ConfirmMembershipDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomStepTwoAppBar(),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18.0),
                  child: Center(child: Text('تأكيد البيانات' , style: Styles.textStyle20W500,)),
                ),
                const SizedBox(
                  height: 4,
                ),
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(AppPaths.image, fit: BoxFit.cover, ),
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                const ConfirmDataFieldAndValueItem(field: 'الإسم', value: 'آلاء علي مصطفي'),
                const ConfirmDataFieldAndValueItem(field: 'رقم الهاتف', value: '0123456789'),
                const ConfirmDataFieldAndValueItem(field: 'الجنس', value: 'أنثي'),
                const ConfirmDataFieldAndValueItem(field: 'الرقم القومي', value: '0123456789'),
                const ConfirmDataFieldAndValueItem(field: 'المبلغ', value: 'المبلغ'),
                const TermsAndConditionsContainer(),
                const SizedBox(
                  height: 32,
                ),
                DefaultButton(
                  function: (){
                    // GoRouter.of(context).push(AppRouters.kPaymentMembershipScreen);
                    GoRouter.of(context).push(AppRouters.kPaymentMembershipScreen);
                  },
                  text: 'الدفع',
                ),
                const SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
