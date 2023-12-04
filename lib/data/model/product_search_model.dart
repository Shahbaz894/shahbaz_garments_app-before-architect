// product_model.dart
class ProductSearchModel {

  final String title;
  final double price;
  final String image;

  ProductSearchModel( { required this.title, required this.price,required this.image,});

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) {
    return ProductSearchModel(

      image:json['image'],
      title: json['title'],
      price: json['price'].toDouble(),
    );
  }
}
