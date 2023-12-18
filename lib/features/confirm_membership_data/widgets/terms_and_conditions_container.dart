import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/styles/styles.dart';

class TermsAndConditionsContainer extends StatelessWidget {
  const TermsAndConditionsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2 , vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.whiteColor,
            boxShadow: const [
              BoxShadow(
                color: AppColors.lightGrayColor,
                blurRadius: 1,
              ),
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0 , horizontal: 14),
          child: Column(
            children: [
              const Text('الشروط والأحكام' , style: Styles.textStyle16W500,),
              const SizedBox(
                height: 20,
              ),
              const Text('Lorem ipsum dolor sit amet consectetur. Nunc sodales elementum iaculis faucibus dolor ac. Aliquet nulla tellus proin scelerisque. Et vestibulum laoreet venenatis vivamus at scelerisque eget. Odio sit suspendisse vitae neque magna tincidunt arcu quis viverra. Lacus tempor pellentesque eget molestie sit. Sed pulvinar at magna donec porttitor purus augue ac consectetur. Risus commodo vulputate massa arcu orci. Posuere amet aliquam est mi nec sollicitudin a. Integer nibh integer facilisis mattis. Sit turpis commodo metus in sagittis. Nullam tempus lorem morbi id amet senectus mattis posuere duis.' , style: Styles.textStyle12W400,textAlign: TextAlign.justify,),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('لقد قرأت جميع الشرط والأحكام وأوافق عليهم' , style: Styles.textStyle10W400.copyWith(color: AppColors.lightGrayColor),),
                  const SizedBox(
                    width: 8,
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
            ],
          ),
        ),
      ),
    );
  }
}
