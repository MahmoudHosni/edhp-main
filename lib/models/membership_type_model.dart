class MembershipType {
  int? iD;
  String? name;
  int? price;
  String? description;

  MembershipType({this.iD, this.name, this.price, this.description});

  MembershipType.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    price = json['Price'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Price'] = this.price;
    data['Description'] = this.description;
    return data;
  }
}