import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/layout/cubit/cubit.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../core/utils/styles/styles.dart';

class CreateMembershipScreen extends StatefulWidget {
  final SubscriptionRequest subscriptionRequest;

  const CreateMembershipScreen({super.key, required this.subscriptionRequest});

  @override
  State<CreateMembershipScreen> createState() => _CreateMembershipScreenState();
}

class _CreateMembershipScreenState extends State<CreateMembershipScreen> {
  int type = 0;

  @override
  Widget build(BuildContext context) {
    print("Company ID : ${widget.subscriptionRequest.MedicalCompanyID}");
    return ViewContainer(
      title: StringsManager.memberShips,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            const Text(
              'اختر نوع عضويتك',
              style: Styles.textStyle15W500,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              ' واستمتع بخدماتنا المتنوعة',
              style: Styles.textStyle10W400,
              textAlign: TextAlign.end,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.subscriptionRequest.SubscriptionTypeID = 1;
                          type = 1;
                          if(memberShips.length>0) {
                            GoRouter.of(context).push(
                                AppRouters.kServiceScreen,
                                extra: widget.subscriptionRequest);
                          }else{
                            GoRouter.of(context).push(
                                AppRouters.kMembershipDataScreen,
                                extra: widget.subscriptionRequest);
                          }
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: AppColors.cardBorderNew),
                          color: type == 1
                              ? AppColors.unselectedColor
                              : AppColors.cardNew,
                        ),
                        child: Container(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                StringsManager.individual,
                                style: Styles.textStyle16W500
                                    .copyWith(color: AppColors.textColorBlue),
                              ),
                              const Spacer(),
                              SvgPicture.asset(AppPaths.individualImage,
                                  height: 105, width: 105),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          widget.subscriptionRequest.SubscriptionTypeID = 2;
                          type = 2;
                          GoRouter.of(context).push(
                              AppRouters.kSelectInsuranceCompany,
                              extra: widget.subscriptionRequest);
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: AppColors.cardBorderNew),
                          color: type == 2
                              ? AppColors.unselectedColor
                              : AppColors.cardNew,
                        ),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                StringsManager.jahat,
                                style: Styles.textStyle16W500
                                    .copyWith(color: AppColors.textColorBlue),
                              ),
                              const Spacer(),
                              SvgPicture.asset(AppPaths.companyImage,
                                  height: 105, width: 105),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
            )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 25,
            ),
          ],
        ),
      ),
    );
  }
}