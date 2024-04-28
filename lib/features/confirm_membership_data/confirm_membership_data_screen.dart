import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/BackCircleButton.dart';
import 'package:edhp/core/utils/app_components/widgets/ConfirmLeftValue.dart';
import 'package:edhp/core/utils/app_components/widgets/ConfirmRightTitle.dart';
import 'package:edhp/core/utils/app_components/widgets/NextButton.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmMemberShipCubit.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmMembershipState.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import '../../core/utils/styles/styles.dart';

class ConfirmMembershipDataScreen extends StatefulWidget {
  final SubscriptionRequest subscriptionRequest;

  const ConfirmMembershipDataScreen(
      {super.key, required this.subscriptionRequest});

  @override
  State<ConfirmMembershipDataScreen> createState() =>
      _ConfirmMembershipDataScreenState();
}

class _ConfirmMembershipDataScreenState
    extends State<ConfirmMembershipDataScreen> {
  late ConfirmMemberShipCubit cubit;
  var msg = "";
  late ProgressDialog pd ;

  @override
  void initState() {
    super.initState();
    cubit = ConfirmMemberShipCubit.get(context);
    pd = ProgressDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ConfirmMemberShipCubit, ConfirmMembershipState>(
        listener: (context, state) {
      if (state is ConfirmMembershipSuccessState) {
        if (int.parse(widget.subscriptionRequest.Cost ?? '0') > 0) {
          msg = state.response.Message??'';
          GoRouter.of(context)
              .push(AppRouters.kPaymentMembershipScreen, extra: state.response);
        } else {
          msg = state.response.Message??'';
          GoRouter.of(context)
              .push(AppRouters.kCardPreviewScreen, extra: state.response);
        }
      } else if (state is ConfirmMembershipErrorState) {
        pd.close();
        showError(state.error);
        // GoRouter.of(context).push(AppRouters.kCardPreviewScreen,extra: widget.subscriptionRequest);
      }
    }, builder: (context, state) {
      return ViewContainer(
        title: StringsManager.memberShips,
        body: Column(
          children: [
            if (state == ConfirmMembershipLoadingState())
              const CircularProgressIndicator(
                color: AppColors.primaryBlueColor,
              ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0),
              child: Center(
                  child: Text(
                'تأكيد البيانات',
                style: Styles.textStyle16W500,
              )),
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
                child: Image.file(
                  widget.subscriptionRequest!.PersonalImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ConfirmLeftValue(
                      vSide: CacheHelper.getData(key: 'profile')),
                  flex: 1,
                ),
                SizedBox(
                  width: 7,
                ),
                ConfirmRightTitle(title: 'الإسم'),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child:
                      ConfirmLeftValue(vSide: CacheHelper.getData(key: 'name')),
                  flex: 1,
                ),
                SizedBox(
                  width: 7,
                ),
                ConfirmRightTitle(title: 'رقم الهاتف'),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: ConfirmLeftValue(
                      vSide: widget.subscriptionRequest.Gender == 1
                          ? genderItems[0]
                          : genderItems[1]),
                  flex: 1,
                ),
                SizedBox(
                  width: 7,
                ),
                ConfirmRightTitle(title: 'الجنس'),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: ConfirmLeftValue(
                      vSide: widget.subscriptionRequest?.IdentityNumber ?? ''),
                  flex: 1,
                ),
                SizedBox(
                  width: 7,
                ),
                ConfirmRightTitle(title: 'الرقم القومي'),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: ConfirmLeftValue(
                      vSide: widget.subscriptionRequest.Cost ?? ''),
                  flex: 1,
                ),
                SizedBox(
                  width: 7,
                ),
                ConfirmRightTitle(title: 'المبلغ'),
              ],
            ),
            SizedBox(
              height: 8,
            ),

            // const TermsAndConditionsContainer(),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: NextButton(
                    function: () {
                      pd.show(max: 100, msg: StringsManager.please_wait.tr());
                      cubit.requestSubscription(widget.subscriptionRequest);
                    },
                    text: 'تأكيد',
                    height: 45,
                    width: 120,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  width: 35,
                  height: 35,
                  child: BackCircleButton(),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Text(msg, style: Styles.textStyle12W400)
          ],
        ),
      );
    });
  }

  void showError(String error) {
    setState(() {
      msg = error;
    });
  }
}
