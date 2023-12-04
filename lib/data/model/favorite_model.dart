class FavoriteProductModel {
  int? id;
  String? title;
  double? price;
  String? image;
  FavoriteProductModel(

      {
        required this.id,
        required this.title,
        required this.price,
        required  this.image,
      });

  FavoriteProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = (json['price'] as num).toDouble();
    image = json['image'];
    //rating =
    //json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }
}


