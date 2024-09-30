import 'package:edhp/features/payment_orders/model/PaymentSubscriptionOrder.dart';
import 'package:edhp/features/payment_orders/model/Result.dart';

class PaymentsOrderResponse{
  List<PaymentSubscriptionOrder>? spSubscriptionPayments;
  int? totalCount;
  Result? result;

  PaymentsOrderResponse({this.spSubscriptionPayments, this.totalCount, this.result});

  PaymentsOrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['SpSubscriptionPayments'] != null) {
      spSubscriptionPayments = <PaymentSubscriptionOrder>[];
      json['SpSubscriptionPayments'].forEach((v) {
        if(v!=null) {
          spSubscriptionPayments!.add(PaymentSubscriptionOrder.fromJson(v));
        }
      });
    }
    totalCount = json['TotalCount'];
    result =
    json['Result'] != null ? new Result.fromJson(json['Result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.spSubscriptionPayments != null) {
      data['SpSubscriptionPayments'] =
          this.spSubscriptionPayments!.map((v) => v.toJson()).toList();
    }
    data['TotalCount'] = this.totalCount;
    if (this.result != null) {
      data['Result'] = this.result!.toJson();
    }
    return data;
  }
}