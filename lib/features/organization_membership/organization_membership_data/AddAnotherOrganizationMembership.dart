import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/BackCircleButton.dart';
import 'package:edhp/core/utils/app_components/widgets/ChoiceImageDialog.dart';
import 'package:edhp/core/utils/app_components/widgets/NextButton.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_paths.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/individual_membership_data/widgets/membership_text_form_field.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/cubit.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/states.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

class AddAnotherOrganizationMembership extends StatefulWidget{
  final SubscriptionRequest subscriptionRequest;

  AddAnotherOrganizationMembership({required this.subscriptionRequest});

  @override
  State<AddAnotherOrganizationMembership> createState() => _AddAnotherOrganizationMembershipState();
}

class _AddAnotherOrganizationMembershipState extends State<AddAnotherOrganizationMembership> {
  TextEditingController membershipNumberController = TextEditingController();
  OrganizationMembershipDataCubit? cubit;
  late ProgressDialog pd ;

  @override
  void initState() {
    super.initState();
    cubit = OrganizationMembershipDataCubit.get(context);
    pd = ProgressDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrganizationMembershipDataCubit, OrganizationMembershipDataStates>(
      listener: (context, state) {      },
      builder: (context, state) {
        return ViewContainer(
          title: StringsManager.memberShips,
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'بيانات عضوية الشركة',
                  style: Styles.textStyle16W500,
                ),
                const SizedBox(
                  height: 16,
                ),

                MembershipTextFormField(
                  maxLength: 14,
                  error: membershipNumberController.text.length == 14 ? '' : "",
                  onSummit: (value) {
                    if (value != null && value.length > 1) {
                      widget.subscriptionRequest.OrganizationMembershipNumber =
                          value;
                    } else {
                      ShowToast.showToast(
                          'برجاء ادخال رقم العضوية بصورة صحيحة');
                      return 'برجاء ادخال رقم العضوية بصورة صحيحة';
                    }
                  },
                  validation: (value) {
                    widget.subscriptionRequest.OrganizationMembershipNumber =
                        value;
                  },
                  controller: membershipNumberController,
                  textInputType: TextInputType.text,
                  nameOfField: 'رقم العضوية',
                ),
                const SizedBox(
                  height: 12,
                ),

                InkWell(
                  onTap: () {
                    ChoiceImageDialog().getImageDialog(
                      context,
                      cubit!.getOrganizationCardFromGallery,
                    );
                  },
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColors.cardBorderNew),
                      color: AppColors.cardNew,
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Expanded(
                              child: Text(
                                'قم برفع صورة كارنية العضوية للمؤسسة',
                                style: Styles.textStyle8W500,
                              )),
                          getImage(cubit?.orgCardImage, AppPaths.notationIdIconSvg),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    const Spacer(),
                    SizedBox(
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
                          validateAndContinue();
                        },
                        text: StringsManager.select,
                        height: 45,
                        width: 120,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void validateAndContinue() {
     if (widget.subscriptionRequest.OrganizationMembershipNumber ==
        null ||
        ((widget.subscriptionRequest.OrganizationMembershipNumber?.length ??
            0) <
            3 ||
            (widget.subscriptionRequest.OrganizationMembershipNumber?.length ??
                0) >
                15)) {
      ShowToast.showToast('برجاء ادخال رقم العضوية بصورة صحيحة');
      return;
    } else if (cubit?.orgCardImage == null ||
        cubit?.orgCardImage?.path == null) {
      ShowToast.showToast('برجاء اختيار صورة كارت العضوية للمؤسسة بصورة صحيحة');
      return;
    } else {
      pd.show(max: 100, msg: StringsManager.please_wait.tr());
      widget.subscriptionRequest.OrganizationMembershipNumberImage = cubit?.orgCardImage;
      pd.close();
      if((widget.subscriptionRequest.MembershipTypeID ??0) >0){
        GoRouter.of(context)
            .push(AppRouters.kConfirmMembershipDataScreen, extra: widget.subscriptionRequest);
      }else {
        GoRouter.of(context)
            .push(AppRouters.kServiceScreen, extra: widget.subscriptionRequest);
      }
    }
    ;
  }

  Widget getImage(File? file, String iconSvg) {
    return file == null ?
    SvgPicture.asset(AppPaths.notationIdIconSvg) :
    ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Image.file(file!, width: 65, height: 65,));
  }

  @override
  void dispose() {
    cubit?.orgCardImage = null;
    super.dispose();
  }
}