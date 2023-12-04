import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:shahbaz_garments_app/ui/screen/product_detail_screen.dart';
import '../../data/model/favorite_model.dart';
import '../../data/model/product_model.dart';
import '../../data/repository/product_reppository.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../domain/db_helper.dart';
import '../../domain/db_helper_fav.dart';
import '../provider/product_cart_provider.dart';

class CorsalSliderScreen extends StatefulWidget {
  CorsalSliderScreen({Key? key}) : super(key: key);

  @override
  _CorsalSliderScreenState createState() => _CorsalSliderScreenState();
}

class _CorsalSliderScreenState extends State<CorsalSliderScreen> {
  int currentIndex = 0;
  DBHelper? dbHelper = DBHelper();
  DBHelperFav dbHelperFav=DBHelperFav();
  @override
  Widget build(BuildContext context) {
    final myProductProvider = Provider.of<MyProductProvider>(context);

    final cartProvider = Provider.of<ProductCartProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<List<ProductModel>>(
          future: myProductProvider.getProduct(), // Assuming a fetchProduct method
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No data available.'));
            } else {
              final imageUrls = snapshot.data!;

              return CarouselSlider.builder(
                itemCount: imageUrls.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final product = imageUrls[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductDetailScreen(
                            title: product.title.toString(),
                            productImage: product.image.toString(),
                            productPrice: product.price,
                            productDescription: product.description.toString(),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 450,
                        width: 400,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                product.image.toString(),
                                width: 300,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: InkWell(
                                onTap: () {
                                  if(dbHelperFav!=null) {
                                    dbHelperFav!.insert(
                                        FavoriteProductModel(
                                          id: product.id,
                                          title: product.title,

                                          price: product.price,
                                          image: product.image,
                                          //rating: product.rating,

                                        )
                                    ).then((value) {
                                      // cartProvider.addTotalPrice(
                                      //     product.price!.toDouble());
                                      // cartProvider.addCounter();

                                      final snackBar = const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text('Product is added to favorites'),
                                        duration: Duration(seconds: 1),);

                                      ScaffoldMessenger.of(context).showSnackBar(
                                          snackBar);
                                    }).onError((error, stackTrace) {
                                      print("error" + error.toString());
                                      final snackBar = const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              'Product is already added in favorite list'),
                                          duration: Duration(seconds: 1));

                                      ScaffoldMessenger.of(context).showSnackBar(
                                          snackBar);
                                    });
                                    ;
                                  }
                                },
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 8,
                              bottom: 8,
                              child: InkWell(
                                onTap: () {
                                  if(dbHelper!=null) {
                                    dbHelper!.insert(
                                        ProductModel(id: product.id,
                                          title: product.title,
                                          quantity:  1  ,
                                          initialPrice: product.price,
                                          price: product.price,
                                          image: product.image,
                                          description: product.description,

                                          //rating: product.rating,

                                        )
                                    ).then((value) {
                                      cartProvider.addTotalPrice(
                                          product.price!.toDouble());
                                      cartProvider.addCounter();

                                      final snackBar = const SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text('Product is added to cart'),
                                        duration: Duration(seconds: 1),);

                                      ScaffoldMessenger.of(context).showSnackBar(
                                          snackBar);
                                    }).onError((error, stackTrace) {
                                      print("error" + error.toString());
                                      final snackBar = const SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                              'Product is already added in cart'),
                                          duration: Duration(seconds: 1));

                                      ScaffoldMessenger.of(context).showSnackBar(
                                          snackBar);
                                    });
                                    ;
                                  }
                                },
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            Positioned(
                              left: 8,
                              bottom: 6,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title.toString().substring(0, 18),
                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 50),
                                  Text(
                                    "\$${product.price}",
                                    style: TextStyle(fontSize: 16, color: Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 180.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
