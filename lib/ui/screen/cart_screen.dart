import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'package:shahbaz_garments_app/ui/screen/shipping_address_screen.dart';

import '../../data/model/product_model.dart';
import '../../domain/db_helper.dart';

import '../provider/product_cart_provider.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<ProductCartProvider>(context);
    return Scaffold(

      body: Column(

        children: [
          Stack(
            children: [
              ClipPath(
                clipper: WaveClipperTwo(reverse: false),
                child: Container(
                  height: 120,
                  width: double.infinity,

                  color: Colors.green,
                  // child: Center(child: Text("WaveClipperTwo(reverse: true)")),
                ),
              ),

              Positioned(
                top: 20,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    // Navigate back to the first screen
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
          FutureBuilder(
            future: cart.getData(),
            builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
              //print("Data retrieved: ${snapshot.data}");
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/bird.jpg'),
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Your cart is empty 😌',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 20,),
                        Text(
                          'Explore products and shop your\nfavourite items',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final product = snapshot.data![index];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image(
                                      height: 100,
                                      width: 100,
                                      image: NetworkImage(product.image.toString()),
                                    ),
                                    SizedBox(width: 10,),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  product.title.toString().substring(0, 18),
                                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                                ),
                                                SizedBox(width: 10,),
                                                InkWell(
                                                  onTap: () {
                                                    dbHelper!.delete(product.id!);
                                                    cart.removerCounter();
                                                    cart.removeTotalPrice(double.parse(snapshot.data![index].price.toString()));
                                                    //cart.removeTotalPrice(product.price);
                                                  },
                                                  child: Icon(Icons.delete),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Text(
                                            product.price.toString(),
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 5,),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: () {
                                                // Handle onTap
                                              },
                                              child: Container(
                                                height: 35,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(4.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          int? quantity = product.quantity!;
                                                          double? productPrice = product.initialPrice;
                                                          quantity--;
                                                          double? newPrice = productPrice! * quantity;
                                                          // int price = snapshot.data![index].initialPrice!.toInt();
                                                          // quantity++;
                                                          // int? newPrice = price * quantity ;

                                                          dbHelper!.updateQuantity(
                                                            ProductModel(
                                                              id: product.id!,
                                                              title: product.title!,
                                                              initialPrice: product.initialPrice,
                                                              price: newPrice.toDouble(),
                                                              quantity: quantity,
                                                              image: product.image.toString(),
                                                            ),
                                                          ).then((value) {
                                                            newPrice = 0;
                                                            quantity = 0;
                                                            //cart.addTotalPrice(product.initialPrice!);
                                                            cart.addTotalPrice(double.parse(snapshot.data![index].price!.toString()));
                                                          }).onError((error, stackTrace) {
                                                            print(error.toString());
                                                          });
                                                        },
                                                        child: Icon(Icons.remove, color: Colors.white),
                                                      ),

                                                      Center(child: Text((product.quantity ??0  ).toString(), style: const TextStyle(color: Colors.white))),

                                                      InkWell(
                                                        onTap: () {
                                                          int? quantity = product.quantity!;
                                                          double? productPrice = product.initialPrice;
                                                          quantity++;
                                                          double? newPrice = productPrice! * quantity;
                                                          // int price = snapshot.data![index].initialPrice!.toInt();
                                                          // quantity++;
                                                          // int? newPrice = price * quantity ;

                                                          dbHelper!.updateQuantity(
                                                            ProductModel(
                                                              id: product.id!,
                                                              title: product.title!,
                                                              initialPrice: product.initialPrice,
                                                              price: newPrice.toDouble(),
                                                              quantity: quantity,
                                                              image: product.image.toString(),
                                                            ),
                                                          ).then((value) {
                                                            newPrice = 0;
                                                            quantity = 0;
                                                            //cart.addTotalPrice(product.initialPrice!);
                                                            cart.addTotalPrice(double.parse(snapshot.data![index].price!.toString()));
                                                          }).onError((error, stackTrace) {
                                                            print(error.toString());
                                                          });
                                                        },
                                                        child: Icon(Icons.add, color: Colors.white),
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShippingAddressScreen()));

            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Center(child: Text('Check Out',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),))),
            ),
          ),
          SizedBox(height: 10,),
          Consumer<ProductCartProvider>(
            builder: (context, value, child) {
              return Visibility(
                visible: value.getTotalPrice().toStringAsFixed(2) == "0.00" ? false : true,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ReusableWidget(title: 'Sub Total', value: r'$' + value.getTotalPrice().toStringAsFixed(2)),
                        // const ReusableWidget(title: 'Discount 5%', value: r'$' + '20'),
                        // ReusableWidget(title: 'Total', value: r'$' + value.getTotalPrice().toString()),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;

  const ReusableWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          Text(value, style: Theme.of(context).textTheme.titleSmall),
        ],
      ),
    );
  }
}
