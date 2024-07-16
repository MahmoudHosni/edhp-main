import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:edhp/models/SubscriptionRequest.dart';

class SubscribtionWithMembership {
  final SubscriptionRequest subscriptionRequest;
  final MemberShipsResponse membership;

  SubscribtionWithMembership({required this.subscriptionRequest,required this.membership});
}