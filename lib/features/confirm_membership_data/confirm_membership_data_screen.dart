import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmMemberShipCubit.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmMembershipState.dart';
import 'package:edhp/features/confirm_membership_data/widgets/custom_step_two_app_bar.dart';
import 'package:edhp/features/confirm_membership_data/widgets/terms_and_conditions_container.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_paths.dart';
import '../../core/utils/styles/styles.dart';
import 'widgets/confirm_data_field_and_value_item.dart';

class ConfirmMembershipDataScreen extends StatefulWidget {
  final SubscriptionRequest subscriptionRequest;

  const ConfirmMembershipDataScreen({super.key,required this.subscriptionRequest});

  @override
  State<ConfirmMembershipDataScreen> createState() => _ConfirmMembershipDataScreenState();
}

class _ConfirmMembershipDataScreenState extends State<ConfirmMembershipDataScreen> {
  late ConfirmMemberShipCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = ConfirmMemberShipCubit.get(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmMemberShipCubit, ConfirmMembershipState>(
        listener: (context, state) {         },
        builder: (context, state) {
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
                    ConfirmDataFieldAndValueItem(field: 'الإسم', value: (CacheHelper.getData(key: 'profile') )),
                    ConfirmDataFieldAndValueItem(field: 'رقم الهاتف', value: CacheHelper.getData(key: 'name')),
                    ConfirmDataFieldAndValueItem(field: 'الجنس', value: widget.subscriptionRequest.Gender==1?genderItems[0]:genderItems[1]),
                    ConfirmDataFieldAndValueItem(field: 'الرقم القومي', value: widget.subscriptionRequest?.IdentityNumber ??''),
                    ConfirmDataFieldAndValueItem(field: 'المبلغ', value: widget.subscriptionRequest.Cost ??''),
                    const TermsAndConditionsContainer(),
                    const SizedBox(
                      height: 32,
                    ),
                    DefaultButton(
                      function: (){
                        cubit.requestSubscription(widget.subscriptionRequest);
                        // // GoRouter.of(context).push(AppRouters.kPaymentMembershipScreen);
                        // GoRouter.of(context).push(AppRouters.kPaymentMembershipScreen);
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
    });
  }
}
