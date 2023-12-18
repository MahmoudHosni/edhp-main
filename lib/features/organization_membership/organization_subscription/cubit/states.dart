abstract class OrganizationSubscriptionStates {}

class OrganizationSubscriptionInitialState extends OrganizationSubscriptionStates {}

class OrganizationSubscriptionLoadingState extends OrganizationSubscriptionStates {}

class OrganizationSubscriptionSuccessfullyState extends OrganizationSubscriptionStates {}

class OrganizationSubscriptionErrorState extends OrganizationSubscriptionStates {
  final String error;

  OrganizationSubscriptionErrorState({
    required this.error,
  });
}

class OrganizationSubscriptionChangePasswordVisibility extends OrganizationSubscriptionStates {}