import 'package:edhp/features/confirm_membership_data/cubit/ConfirmResponse.dart';
import 'package:flutter/cupertino.dart';

abstract class ConfirmMembershipState{}

class ConfirmMembershipSuccessState extends ConfirmMembershipState{
    ConfirmResponse response;

    ConfirmMembershipSuccessState({required this.response});
}

class ConfirmMembershipErrorState extends ConfirmMembershipState{
    String error;

    ConfirmMembershipErrorState({required this.error});
}

class ConfirmMembershipLoadingState extends ConfirmMembershipState{}