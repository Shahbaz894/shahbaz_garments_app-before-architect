// import 'package:flutter/material.dart';
// import 'package:shahbaz_garments_app/data/model/product_model.dart';
// import 'package:shahbaz_garments_app/domain/db_helper.dart';
// import 'package:shahbaz_garments_app/ui/screen/dlivery_address_screen.dart';
//
// import '../../data/model/shipping_address_model.dart';
// import '../../domain/shipping_addres_database.dart';
// import '../provider/shipping_addres_provider.dart';
//
//
//
// class MyOrders extends StatefulWidget {
//   @override
//   _MyOrdersState createState() => _MyOrdersState();
// }
//
// class _MyOrdersState extends State<MyOrders> {
//   final DBHelper dbHelper = DBHelper();
//   final DBHelperShipping dbHelperShipping=DBHelperShipping();
//   ShippingAddressProvider shippingAddressProvider=ShippingAddressProvider();
//   List<ProductModel> orders = [];
//   List<ShippingAddress>? _addressList;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadOrders();
//   }
//
//   void _loadOrders() async {
//     List<ProductModel> loadedOrders = await dbHelper.getCartList();
//     setState(() {
//       orders = loadedOrders;
//     });
//   }
//   Future<void> _refreshAddressList() async {
//     final addresses = await dbHelperShipping.getShippingAddressList();
//     setState(() {
//       _addressList = addresses;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBar(
//        backgroundColor: Colors.green,
//         title: Text('Order Detail'),
//       ),
//       body: Column(
//         children: [
//           ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount: orders.length,
//             itemBuilder: (context, index) {
//               final order = orders[index];
//               return
//                 Padding(
//                   padding: const EdgeInsets.all(15.0),
//                   child: Column(
//                     children: [
//                      Row(
//                        children: [
//                          Container(
//                              height: 160,
//                              width: 160,
//                              decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(20)
//                              ),
//                              child: Image.network(order.image.toString())),
//                          SizedBox(width: 100,),
//                         Column(
//                           children: [
//                             const Text('#014756',style: TextStyle(color: Colors.green,fontSize: 20),),
//                             const SizedBox(height: 5,),
//                             Text('Rs:${order.price}',style: TextStyle(color: Colors.green),),
//                           ],
//                         )
//                          //Text(order.quantity.toInt()),
//
//                        ],
//                      ),
//                       const SizedBox(height: 20,),
//                       Row(children: [
//                         const Text('25 min',style: TextStyle(fontSize: 30),),
//                         SizedBox(width: 80,),
//
//                         Text(order.title.toString().substring(0,18),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
//
//                       ],),
//                        SizedBox(height: 25,),
//                        Row(children: [
//                          GestureDetector(
//                            onTap: (){
//                         //dbHelper.delete(order!.id as int);
//                         dbHelper!.delete(order.id!);
//                            },
//                            child: Container(
//                              height: 50,
//                              width: 150,
//                              decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(25),
//                                color: Colors.green
//
//                              ),
//                              child: Center(child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
//                            ),
//                          ),
//                        //  SizedBox(width: 50,),
//                          // GestureDetector(
//                          //   onTap: (){},
//                          //   child: Container(
//                          //     height: 50,
//                          //     width: 150,
//                          //     decoration: BoxDecoration(
//                          //         borderRadius: BorderRadius.circular(25),
//                          //         color: Colors.green
//                          //
//                          //     ),
//                          //     child: Center(child: Text('Track Order',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
//                          //   ),
//                          // ),
//                         // InkWell(onTap: (){},
//                         //   child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold),),
//                         // ),
//                         //  InkWell(onTap: (){},
//                         //    child: const Text('Track-Order',style: TextStyle(fontWeight: FontWeight.bold),),
//                         //  )
//                       ],),
//                      Container(
//                        height: 100,
//                        width: double.infinity,
//                        child: ListView.builder(
//                            itemCount: _addressList?.length ?? 0,
//                            itemBuilder: (context, index){
//                              final address = _addressList![index];
//                              return Column(
//                                children: [
//                                  Text('Address: ${address.address}'),
//                                //   Card(
//                                //     elevation: 2,
//                                //     margin: EdgeInsets.symmetric(vertical: 10),
//                                //     child: Container(
//                                //       height: 100,
//                                //       width: double.infinity,
//                                //       decoration: BoxDecoration(
//                                //         borderRadius: BorderRadius.circular(16),
//                                //         border: Border.all(color: Colors.black45),
//                                //       ),
//                                //       child: ListTile(
//                                //         title: Text(
//                                //           'Name: ${address.name}',
//                                //           style: TextStyle(fontSize: 16),
//                                //         ),
//                                //         subtitle: Column(
//                                //           mainAxisAlignment: MainAxisAlignment.start,
//                                //           crossAxisAlignment: CrossAxisAlignment.start,
//                                //           children: [
//                                //             Text('Address: ${address.address}'),
//                                //             Text('Mobile: ${address.mobile}'),
//                                //           ],
//                                //         ),
//                                //
//                                //       ),
//                                //     ),
//                                //   ),
//                                 ],
//                              );
//                            }),
//                      ),
//
//                     ],
//                   ),
//                 );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
// //03007828931 majeed clark

import 'package:flutter/material.dart';
import 'package:shahbaz_garments_app/data/model/product_model.dart';
import 'package:shahbaz_garments_app/domain/db_helper.dart';
import 'package:shahbaz_garments_app/domain/shipping_addres_database.dart';
import 'package:shahbaz_garments_app/ui/screen/dlivery_address_screen.dart';
import '../../data/model/shipping_address_model.dart';
import '../provider/shipping_addres_provider.dart';

class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  final DBHelper dbHelper = DBHelper();
  final DBHelperShipping dbHelperShipping = DBHelperShipping();
  ShippingAddressProvider shippingAddressProvider = ShippingAddressProvider();
  List<ProductModel> orders = [];
  List<ShippingAddress>? _addressList;

  @override
  void initState() {
    super.initState();
    _loadOrders();
    _refreshAddressList();
  }

  void _loadOrders() async {
    List<ProductModel> loadedOrders = await dbHelper.getCartList();
    setState(() {
      orders = loadedOrders;
    });
  }

  Future<void> _refreshAddressList() async {
    final addresses = await dbHelperShipping.getShippingAddressList();
    setState(() {
      _addressList = addresses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Order Detail'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 160,
                            width: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(order.image.toString()),
                          ),
                          SizedBox(width: 100,),
                          Column(
                            children: [
                              const Text(
                                '#014756',
                                style: TextStyle(color: Colors.green, fontSize: 20),
                              ),
                              const SizedBox(height: 5,),
                              Text('Rs:${order.price}', style: TextStyle(color: Colors.green),),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          const Text('25 min', style: TextStyle(fontSize: 30),),
                          SizedBox(width: 80,),
                          Text(order.title.toString().substring(0, 18),
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 25,),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              dbHelper!.delete(order.id!);
                            },
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.green,
                              ),
                              child: Center(child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 100,
                        width: double.infinity,
                        child: ListView.builder(
                            itemCount: _addressList?.length ?? 0,
                            itemBuilder: (context, index) {
                              final address = _addressList![index];
                              return Column(
                                children: [
                                  Text('Address: ${address.address}'),
                                ],
                              );
                            }),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

