import 'package:edhp/core/utils/StringsManager.dart';
 import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/features/service/widgets/membership_type_container.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ServiceScreen extends StatefulWidget {
  final SubscriptionRequest subscriptionRequest;

  const ServiceScreen({super.key, required this.subscriptionRequest});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late OurProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = OurProductCubit.get(context);
    if (widget.subscriptionRequest.SubscriptionTypeID == 2) {
      cubit.getMembershipType(
          NationalNumber: widget.subscriptionRequest.IdentityNumber,
          OrganizationID: widget.subscriptionRequest.OrganizationID,
          OrganizationMembershipNumber:
              widget.subscriptionRequest.OrganizationMembershipNumber ?? '');
    } else {
      cubit.getMembershipType();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OurProductCubit, OurProductStates>(
      listener: (context, state) {
        if(state is OurProductInitialState || state is OurProductLoadingState){
          EasyLoading.show(status: StringsManager.please_wait);
        }else if(state is OurProductSuccessfullyState){
          EasyLoading.dismiss();
        }
      },
      builder: (context, state) {
        return ViewContainer(
            title: StringsManager.membershipCards,
            body: SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              MembershipTypeContainer(membershipType: cubit.membershipTypeList[index],
                            subscriptionRequest: widget.subscriptionRequest,
                            clickable: (widget.subscriptionRequest
                                        .SubscriptionTypeID ??
                                    0) >
                                0,
                          ),
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 30,
                          ),
                          itemCount: cubit.membershipTypeList.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
