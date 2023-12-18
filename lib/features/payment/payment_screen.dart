import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/payment/widgets/custom_step_three_app_bar.dart';
import 'package:edhp/features/payment/widgets/payment_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cNNController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CustomStepThreeAppBar(),
                const Text('الدفع' , style: Styles.textStyle16W500,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/18,
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppPaths.masterCardSvg),
                    const SizedBox(
                      width: 16,
                    ),
                    Image.asset(AppPaths.visaCardSvg),
                    const Spacer(),
                    const Text('بطاقة إئتمان' , style: Styles.textStyle14W500,)
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/20,
                ),
                PaymentTextFormField(
                  text: 'رقم البطاقة',
                  controller: cardNumberController,
                  textInputType: TextInputType.number,
                  validation: (value){},
                  fieldName: '1234 5678 9101 1213',
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  children: [
                    Expanded(
                      child: PaymentTextFormField(
                        controller: cNNController,
                        textInputType: TextInputType.number,
                        validation: (value){

                        },
                        fieldName: '123',
                        text: 'CVV',
                      ),
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Expanded(
                      child: PaymentTextFormField(
                        controller: expiryDateController,
                        textInputType: TextInputType.text,
                        validation: (value){

                        },
                        fieldName: 'MM/YY',
                        text: 'تاريخ الإنتهاء',
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('حفظ بيانات البطاقه' , style: Styles.textStyle14W500.copyWith(color: AppColors.lightGrayColor),),
                    const SizedBox(
                      width: 18,
                    ),
                    InkWell(
                      onTap: (){

                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2.0),
                              border: Border.all(
                                color: AppColors.lightGrayColor,
                                width: 1
                              )
                            ),
                          ),
                          const Icon(Icons.check , color: AppColors.lightGrayColor, size: 18,)
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height/18,
                ),
                DefaultButton(function: (){}, text: 'الدفع'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
