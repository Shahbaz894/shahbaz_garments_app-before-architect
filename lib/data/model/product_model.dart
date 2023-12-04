class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;

  String? image;
  //Rating? rating;
  double? initialPrice;
  int? quantity;

  ProductModel(

      {
        required this.id,
        required this.title,
        required this.quantity,
        this.initialPrice,
        required this.price,
        this.description,

        required  this.image,
        //this.rating
      });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    quantity = json['quantity'];
    initialPrice = json['initialPrice'];
    // Convert the integer price to double
    // price = (json['price']) ;
    price = (json['price'] as num).toDouble();
    // double price = json['price'] is int
    //     ? (json['price'] as int).toDouble()
    //     : json['price'];


    //price = json['price']?.toDouble();
    description = json['description'];

    image = json['image'];
    //rating =
    //json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['quantity'] = this.quantity;
    data['initialPrice'] = this.initialPrice;
    data['price'] = this.price;
    data['description'] = this.description;

    data['image'] = this.image;
    // if (this.rating != null) {
    //   data['rating'] = this.rating!.toJson();
    //}
    return data;
  }
}


