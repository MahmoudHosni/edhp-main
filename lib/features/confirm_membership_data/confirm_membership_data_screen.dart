import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/Utilites.dart';
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
import 'package:edhp/features/layout/cubit/cubit.dart';
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
          while(GoRouter.of(context).canPop()){
            GoRouter.of(context).pop();
          }
          GoRouter.of(context)
              .push(AppRouters.kCreatePaymentScreen, extra: state.response);
        } else {
          msg = state.response.Message??'';
          while(GoRouter.of(context).canPop()){
            GoRouter.of(context).pop();
          }
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
        body: SingleChildScrollView(child: Column(
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
                child:(widget.subscriptionRequest!.PersonalImage!=null)? Image.file(
                  widget.subscriptionRequest!.PersonalImage!,
                  fit: BoxFit.cover,
                ):const SizedBox(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ConfirmRightTitle(title: 'الإسم'),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  flex: 1,
                  child: ConfirmLeftValue(
                      vSide: widget.subscriptionRequest.ArabicName ?? CacheHelper.getData(key: 'profile')),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                ConfirmRightTitle(title: 'رقم الهاتف'),

                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  flex: 1,
                  child:
                  ConfirmLeftValue(vSide: widget.subscriptionRequest.MobileNumber ?? CacheHelper.getData(key: 'name')),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [

                ConfirmRightTitle(title: 'الجنس'),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  flex: 1,
                  child: ConfirmLeftValue(
                      vSide: widget.subscriptionRequest.Gender == 1
                          ? genderItems[0]
                          : genderItems[1]),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [

                ConfirmRightTitle(title: 'الرقم القومي'),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  flex: 1,
                  child: ConfirmLeftValue(
                      vSide: widget.subscriptionRequest?.IdentityNumber ?? ''),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [

                ConfirmRightTitle(title: 'المبلغ'),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  flex: 1,
                  child: ConfirmLeftValue(
                      vSide: widget.subscriptionRequest.Cost ?? ''),
                ),
              ],
            ),

            // const TermsAndConditionsContainer(),
            const SizedBox(
              height: 32,
            ),
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  child: BackCircleButton(),
                ),

                const SizedBox(
                  width: 8,
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: NextButton(
                    function: () {
                      pd.show(max: 100, msg: StringsManager.please_wait.tr());
                      if(widget.subscriptionRequest.isRelativeRequest || memberShips.isEmpty) {
                        cubit.requestSubscription(widget.subscriptionRequest);
                      }else{
                        widget.subscriptionRequest.SubscriptionStartDate = getStartDate();
                        widget.subscriptionRequest.SubscriptionEndDate   = getEndDate();
                        cubit.addAnotherSubscription(widget.subscriptionRequest);
                      }
                    },
                    text: 'تأكيد',
                    height: 45,
                    width: 120,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            Text(msg, style: Styles.textStyle12W400)
          ],
        )),
      );
    });
  }

  void showError(String error) {
    setState(() {
      msg = error;
    });
  }
}
