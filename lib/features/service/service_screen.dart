import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/features/service/widgets/membership_type_container.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/utils/app_components/widgets/back_custom_app_bar.dart';
import '../../core/utils/styles/styles.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ServiceScreen extends StatefulWidget {
  final SubscriptionRequest subscriptionRequest;
  const ServiceScreen({super.key,required this.subscriptionRequest});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late OurProductCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = OurProductCubit.get(context);
    if(widget.subscriptionRequest.SubscriptionTypeID==2){
      cubit.getMembershipType(
        NationalNumber: widget.subscriptionRequest.IdentityNumber,
        OrganizationID: widget.subscriptionRequest.OrganizationID,
        OrganizationMembershipNumber: widget.subscriptionRequest.OrganizationMembershipNumber??'');
    }else{
      cubit.getMembershipType();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OurProductCubit, OurProductStates>(
      listener: (context, state) {      },
      builder: (context, state) {
        return ViewContainer(title: StringsManager.membershipCards,body:SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => MembershipTypeContainer(
                          price: cubit.membershipTypeList[index].price.toString(),
                          name: cubit.membershipTypeList[index].name.toString(),
                          description: cubit.membershipTypeList[index].description.toString(),
                          id: cubit.membershipTypeList[index].iD??0,subscriptionRequest: widget.subscriptionRequest,
                          clickable: (widget.subscriptionRequest.SubscriptionTypeID ??0) >0,
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
