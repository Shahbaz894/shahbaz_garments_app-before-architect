class ShippingAddress {
  int? id;
  String? name;
  String? address;
  String? orderNumber;
  String? mobile;


  ShippingAddress({ this.id, required this.name, required this.address,  this.orderNumber,  this. mobile});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    orderNumber = json['orderNumber'];
    mobile = json['mobile'] ;

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile'] = this.mobile;

    return data;
  }

}
