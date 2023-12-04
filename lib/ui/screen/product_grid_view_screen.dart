import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahbaz_garments_app/ui/screen/product_detail_screen.dart';

import '../../data/model/favorite_model.dart';
import '../../data/model/product_model.dart';
import '../../data/repository/product_reppository.dart';
import '../../domain/db_helper.dart';
import '../../domain/db_helper_fav.dart';
import '../provider/product_cart_provider.dart';

class ProductGridViewScreen extends StatefulWidget {
  @override
  State<ProductGridViewScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProductGridViewScreen> {
  DBHelper? dbHelper = DBHelper();
  DBHelperFav dbHelperFav=DBHelperFav();
  @override
  Widget build(BuildContext context) {
    final myProductProvider = Provider.of<MyProductProvider>(context);

    final cartProvider = Provider.of<ProductCartProvider>(context);

    return Scaffold(

      body: FutureBuilder<void>(
        future: myProductProvider.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (myProductProvider.myDataList.isEmpty) {
            return const Center(child: Text('No products available.'));
          } else {
            return
              GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 2,
                ),
                itemCount: myProductProvider.myDataList.length,
                itemBuilder: (BuildContext ctx, index) {
                  final product = myProductProvider.myDataList[index];

                  return GestureDetector(
                    onTap: () {
                      // Navigate to product detail screen
                      Navigator.push(
                        context,
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
                    child: Container(
                      height: 300,
                      width: 300,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Column(
                                children: [
                                  // Product image
                                  Image.network(
                                    product.image.toString(),
                                    height: 100, // Adjust as needed
                                  ),
                                  SizedBox(height: 20,),

                                  // Product title
                               Row(children: [
                                 Text(
                                   product.title.toString().substring(0,18),
                                   maxLines: 1,
                                   overflow: TextOverflow.ellipsis,
                                 ),

                                 // Product price
                                 Text(
                                   "\$" + product.price.toString(),
                                   style: TextStyle(fontSize: 16, color: Colors.green),
                                 ),
                               ],)
                                ],
                              ),
                              Positioned(
                                top: 2, // Adjust the top position
                                right: 2, // Adjust the right position
                                child:
                                IconButton(
                                  onPressed: () {

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
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 2, // Adjust the top position
                                right: 2, // Adjust the right position
                                child: IconButton(
                                  onPressed: () {
                                    // Implement your favorite logic here
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
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.green

                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),

                                  ),
                                ),
                              ),

                            ],
                          ),

                        ],
                      ),
                    ),
                  );
                },
              );


          }
        },
      ),
    );
  }
}