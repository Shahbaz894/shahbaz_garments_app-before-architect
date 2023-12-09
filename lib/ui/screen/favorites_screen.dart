import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/favorite_model.dart';
import '../../data/model/product_model.dart';
import '../../domain/db_helper.dart';

import '../../domain/db_helper_fav.dart';
import '../provider/favorite_product_provider.dart';
import '../provider/product_cart_provider.dart';


class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  //DBHelper? dbHelper = DBHelper();
  DBHelperFav dbHelperFav=DBHelperFav();

  @override
  Widget build(BuildContext context) {
    final favorite = Provider.of<FavoritesProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: const Text('Favorite')),
        centerTitle: true,


      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            FutureBuilder<List<FavoriteProductModel>>(
              future: context.read<FavoritesProductProvider>().getData(),
              builder: (context,  snapshot) {
                //print("Data retrieved: ${snapshot.data}");
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Align(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          'No Favourite Product is Added 😌',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final product = snapshot.data![index];
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        height: 250,
                                        width: 350,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Colors.black45),
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRect(
                                              clipBehavior: Clip.antiAlias,
                                              child: Stack(
                                                children: [
                                                  Image(
                                                    height: 250 / 1.5,
                                                    width: 320,
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(product.image.toString()),
                                                  ),

                                                  Container(
                                                    height: 30,
                                                    width: 90,
                                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white),
                                                    child: Center(
                                                      child: Text(
                                                        '\$${product.price}',
                                                        style: TextStyle(fontSize: 20, color: Colors.green,fontWeight: FontWeight.bold),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    product.title.toString().substring(0,18),
                                                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                                  ),
                                                  Spacer(),
                                                  Positioned(
                                                      bottom: 1,
                                                      right: 1,
                                                      child: IconButton(onPressed: () {  }, icon: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(20),
                                                              color: Colors.green

                                                          ),
                                                          child: Icon(Icons.add,color: Colors.white,)),

                                                  )),
                                                  Positioned(
                                                      child:  TextButton(onPressed: (){
                                                        dbHelperFav.delete(product.id!.toInt());
                                                      },

                                                          child: Text('Delete',
                                                            style:TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 14)
                                                            ,)) )
                                                ],
                                              ),
                                            ),

                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )


                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
                return Center(child: CircularProgressIndicator()
                );},

            ),

          ],
        ),
      ),
    );
  }
}

