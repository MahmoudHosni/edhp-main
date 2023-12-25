import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/back_custom_app_bar.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/styles/styles.dart';

class CreateMembershipScreen extends StatelessWidget {
  final SubscriptionRequest subscriptionRequest;

  const CreateMembershipScreen({super.key,required this.subscriptionRequest});

  @override
  Widget build(BuildContext context) {
    print("Company ID : ${subscriptionRequest.MedicalCompanyID}");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0 , vertical: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text('إنشاء عضويات' , style: Styles.textStyle20W500,),
              const SizedBox(
                height: 30,
              ),
              const Text('! يمكنك إنشاء عضويتك بكل سهولة ويسر للإستمتاع بخدماتنا المتنوعة بادر بالتسجيل' , style: Styles.textStyle14W400, textAlign: TextAlign.end,),
              SizedBox(
                height: MediaQuery.of(context).size.height / 20,
              ),
              const Text('اختر نوع عضويتك' , style: Styles.textStyle20W500,),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        subscriptionRequest.SubscriptionTypeID = 2;
                        GoRouter.of(context).push(AppRouters.kSelectInsuranceCompany,extra: subscriptionRequest);
                      },
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
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Image.asset(AppPaths.companyImage),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(StringsManager.jahat , style: Styles.textStyle16W400,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        subscriptionRequest.SubscriptionTypeID = 1;
                        GoRouter.of(context).push(AppRouters.kMembershipDataScreen,extra: subscriptionRequest);
                      },
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
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            children: [
                              Image.asset(AppPaths.individualImage),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(StringsManager.individual , style: Styles.textStyle16W400,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
