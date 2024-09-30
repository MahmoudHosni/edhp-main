

class PaymentSubscriptionOrder{
  int? iD;
  String? subscriptionNumber;
  String? dateApproval;
  int? executionStatus;
  String? executionStatusName;
  int? approvalStatus;
  String? approvalStatusName;
  String? creationTime;
  String? creationServiceProviderBranchName;
  bool? isPaid;
  double? finalSalePrice;
  int? paymentCat;
  PaymentOrder? paymentOrder;

  PaymentSubscriptionOrder(
      {this.iD,
        this.subscriptionNumber,
        this.dateApproval,
        this.executionStatus,
        this.executionStatusName,
        this.approvalStatus,
        this.approvalStatusName,
        this.creationTime,
        this.creationServiceProviderBranchName,
        this.isPaid,
        this.finalSalePrice,
        this.paymentOrder});

  PaymentSubscriptionOrder.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    subscriptionNumber = json['SubscriptionNumber'];
    dateApproval = json['DateApproval'];
    executionStatus = json['ExecutionStatus'];
    executionStatusName = json['ExecutionStatusName'];
    approvalStatus = json['ApprovalStatus'];
    approvalStatusName = json['ApprovalStatusName'];
    creationTime = json['CreationTime'];
    creationServiceProviderBranchName = json['CreationServiceProviderBranchName'];
    isPaid = json['IsPaid'];
    finalSalePrice = json['FinalSalePrice'] ??0;
    paymentOrder =json['PaymentOrder']!=null?  PaymentOrder.fromJson(json['PaymentOrder']):null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['SubscriptionNumber'] = this.subscriptionNumber;
    data['DateApproval'] = this.dateApproval;
    data['ExecutionStatus'] = this.executionStatus;
    data['ExecutionStatusName'] = this.executionStatusName;
    data['ApprovalStatus'] = this.approvalStatus;
    data['ApprovalStatusName'] = this.approvalStatusName;
    data['CreationTime'] = this.creationTime;
    data['CreationServiceProviderBranchName'] =
        this.creationServiceProviderBranchName;
    data['IsPaid'] = this.isPaid;
    data['FinalSalePrice'] = this.finalSalePrice;
    if (this.paymentOrder != null) {
      data['PaymentOrder'] = this.paymentOrder!.toJson();
    }
    return data;
  }
}

class PaymentOrder {
  String? referenceCode;
  int? payAmount;
  String? productName;
  String? productDescription;

  PaymentOrder(
      {this.referenceCode,
        this.payAmount,
        this.productName,
        this.productDescription});

  PaymentOrder.fromJson(Map<String, dynamic> json) {
    referenceCode = json['ReferenceCode'];
    payAmount = json['PayAmount'];
    productName = json['ProductName'];
    productDescription = json['ProductDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ReferenceCode'] = this.referenceCode;
    data['PayAmount'] = this.payAmount;
    data['ProductName'] = this.productName;
    data['ProductDescription'] = this.productDescription;
    return data;
  }
}