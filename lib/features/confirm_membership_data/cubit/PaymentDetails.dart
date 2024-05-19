

class PaymentDetails {
    String referenceCode='';
    int PayAmount =0;
    String productName = "";
    String productDetails = "";

    PaymentDetails({required this.referenceCode, required this.PayAmount,required this.productName,required this.productDetails});

    PaymentDetails.fromJson(Map<String, dynamic> json) {
      referenceCode = json['ReferenceCode'];
      PayAmount = json['PayAmount'];
      productName = json['ProductName'];
      productDetails = json['ProductDescription'];

    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = <String, dynamic>{};
      data['ReferenceCode'] = referenceCode;
      data['PayAmount'] = PayAmount;
      data['ProductName'] = productName;
      data['ProductDescription'] = productDetails;

      return data;
    }
}