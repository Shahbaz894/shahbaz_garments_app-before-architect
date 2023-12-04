// // //
// // //
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// // // import 'package:shahbaz_garments_app/ui/provider/shipping_addres_provider.dart';
// // // import 'package:shahbaz_garments_app/ui/screen/shipping_address_screen.dart';
// // // import 'package:sqflite/sqflite.dart';
// // // import 'package:path/path.dart';
// // // import '../../data/model/shipping_address_model.dart';
// // // import '../../domain/shipping_addres_database.dart';
// // //
// // // class DeliveryAddressScreen extends StatefulWidget {
// // //   const DeliveryAddressScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
// // // }
// // //
// // // class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
// // //   late Future<List<ShippingAddress>> _addressList;
// // //   ShippingAddressProvider shippingAddressProvider=ShippingAddressProvider();
// // //   DBHelperShipping dbHelperShipping=DBHelperShipping();
// // //   TextEditingController nameControl= TextEditingController();
// // //   TextEditingController addresControl= TextEditingController();
// // //
// // //   TextEditingController mobileConlol= TextEditingController();
// // //
// // //
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _refreshAddressList();
// // //   }
// // //
// // //   Future<void> _refreshAddressList() async {
// // //     setState(() {
// // //       _addressList = DBHelperShipping().getShippingAddressList();
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //
// // //       body: Stack(
// // //         children: [
// // //           ClipPath(
// // //             clipper: WaveClipperTwo(reverse: false),
// // //             child: Container(
// // //               height: 120,
// // //               width: double.infinity,
// // //
// // //               color: Colors.green,
// // //               // child: Center(child: Text("WaveClipperTwo(reverse: true)")),
// // //             ),
// // //           ),
// // //
// // //           Padding(
// // //             padding: const EdgeInsets.only(top: 120,right: 8,left: 8),
// // //             child: FutureBuilder<List<ShippingAddress>>(
// // //               future: _addressList,
// // //               builder: (context, snapshot) {
// // //                 if (snapshot.connectionState == ConnectionState.waiting) {
// // //                   return Center(child: CircularProgressIndicator());
// // //                 } else if (snapshot.hasError) {
// // //                   return Center(child: Text('Error: ${snapshot.error}'));
// // //                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// // //                   return Center(child: Text('No addresses available.'));
// // //                 } else {
// // //                   return ListView.builder(
// // //                     itemCount: snapshot.data!.length,
// // //                     itemBuilder: (context, index) {
// // //                       final address = snapshot.data![index];
// // //                       return Column(
// // //                         children: [
// // //                           Card(
// // //                             elevation: 2,
// // //                             margin: EdgeInsets.symmetric(vertical: 10),
// // //                             child: Container(
// // //                               height: 100,
// // //                               width: double.infinity,
// // //                               decoration: BoxDecoration(
// // //                                 borderRadius: BorderRadius.circular(16),
// // //                                 border: Border.all(color: Colors.black45)
// // //                               ),
// // //                               child: ListTile(
// // //                                 title: Text(
// // //                                   'Name: ${address.name}',
// // //                                   style: TextStyle(fontSize: 16),
// // //                                 ),
// // //                                 subtitle: Column(
// // //                                   mainAxisAlignment: MainAxisAlignment.start,
// // //                                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                                   children: [
// // //                                     Text('Address: ${address.address}'),
// // //                                     Text('Mobile: ${address.mobile}'),
// // //                                   ],
// // //                                 ),
// // //                                 trailing: Row(
// // //                                   mainAxisSize: MainAxisSize.min,
// // //                                   children: [
// // //                                     IconButton(
// // //                                       icon: Icon(Icons.edit,color: Colors.green,),
// // //                                       onPressed: () {
// // //                                         _showEditDialog(context);
// // //                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>ShippingAddressScreen()));
// // //                                         _editAddress(address);
// // //                                       },
// // //                                     ),
// // //                                     IconButton(
// // //                                       icon: Icon(Icons.delete,color: Colors.red,),
// // //                                       onPressed: () {
// // //                                         // Implement delete functionality here
// // //                                         _deleteAddress(address);
// // //                                       },
// // //                                     ),
// // //                                   ],
// // //                                 ),
// // //                               ),
// // //                             ),
// // //
// // //                           ),
// // //                           InkWell(
// // //                           onTap:() async{
// // //                             await dbHelperShipping.updateAddress(
// // //                            // Assuming user id is 1
// // //                               dbHelperShipping.updateAddress(address ) as ShippingAddress,
// // //                             );
// // //
// // //                             Navigator.pop(context);
// // //                           },
// // //
// // //                             child: Padding(
// // //                               padding: const EdgeInsets.only(top: 25.0),
// // //                               child: Container(
// // //                                 height: 60,
// // //                                 width: 200,
// // //                                 decoration: BoxDecoration(
// // //                                   borderRadius: BorderRadius.circular(20),
// // //                                   border: Border.all(color: Colors.black45),
// // //                                   color: Colors.green
// // //                                 ),
// // //                                 child: Center(child: Text('Update Addres')),
// // //
// // //                               ),
// // //                             ),
// // //                           )
// // //
// // //                         ],
// // //                       );
// // //                     },
// // //                   );
// // //                 }
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   void _editAddress(ShippingAddress address) {
// // //     // Implement edit functionality
// // //     // You can navigate to another screen for editing the address
// // //     dbHelperShipping.updateAddress(address.id! as ShippingAddress);
// // //   }
// // //
// // //   void _deleteAddress(ShippingAddress address) async {
// // //     // Implement delete functionality
// // //    dbHelperShipping.delete(address.id!);
// // //     _refreshAddressList();
// // //   }
// // //   void _showEditDialog(BuildContext context) {
// // //     showDialog(
// // //       context: context,
// // //       builder: (context) {
// // //         return AlertDialog(
// // //           title: Text('Edit User'),
// // //           content: Column(
// // //             children: [
// // //               TextField(
// // //                 controller: nameControl,
// // //                 decoration: InputDecoration(labelText: 'Name'),
// // //               ),
// // //               TextField(
// // //                 controller: addresControl,
// // //                 decoration: InputDecoration(labelText: 'Address'),
// // //               ),
// // //               TextField(
// // //                 controller: mobileConlol,
// // //                 decoration: InputDecoration(labelText: 'Mobile'),
// // //               ),
// // //             ],
// // //           ),
// // //           actions: [
// // //             TextButton(
// // //               onPressed: () {
// // //                 Navigator.pop(context);
// // //               },
// // //               child: Text('Cancel'),
// // //             ),
// // //             TextButton(
// // //               onPressed: () async {
// // //                 // Save the edited data to the database
// // //                widget. address.name = nameController.text;
// // //                 address.address = addressController.text;
// // //                 address.mobile = mobileController.text;
// // //
// // //                 // Update the address in the database
// // //                 await dbHelperShipping.updateAddress(address);
// // //
// // //                 Navigator.pop(context);
// // //               },
// // //               child: Text('Save'),
// // //             ),
// // //           ],
// // //         );
// // //       },
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// //
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// // import 'package:shahbaz_garments_app/domain/shipping_addres_database.dart';
// // import 'package:shahbaz_garments_app/ui/provider/shipping_addres_provider.dart';
// //
// // import '../../data/model/shipping_address_model.dart';
// //
// // class DeliveryAddressScreen extends StatefulWidget {
// //   const DeliveryAddressScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
// // }
// //
// // class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
// //   late Future<List<ShippingAddress>> _addressList;
// //   ShippingAddressProvider shippingAddressProvider = ShippingAddressProvider();
// //   DBHelperShipping dbHelperShipping = DBHelperShipping();
// //   TextEditingController nameControl = TextEditingController();
// //   TextEditingController addresControl = TextEditingController();
// //   TextEditingController mobileConlol = TextEditingController();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _refreshAddressList();
// //   }
// //
// //   Future<void> _refreshAddressList() async {
// //     setState(() {
// //       _addressList = dbHelperShipping.getShippingAddressList();
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Colors.green,
// //         title: Text('Edit Address'),
// //         // Add a back arrow to the app bar
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.only(top: 120, right: 8, left: 8),
// //         child: FutureBuilder<List<ShippingAddress>>(
// //           future: _addressList,
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return Center(child: CircularProgressIndicator());
// //             } else if (snapshot.hasError) {
// //               return Center(child: Text('Error: ${snapshot.error}'));
// //             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //               return Center(child: Text('No addresses available.'));
// //             } else {
// //               return ListView.builder(
// //                 itemCount: snapshot.data!.length,
// //                 itemBuilder: (context, index) {
// //                   final address = snapshot.data![index];
// //                   return Column(
// //                     children: [
// //                       Card(
// //                         elevation: 2,
// //                         margin: EdgeInsets.symmetric(vertical: 10),
// //                         child: Container(
// //                           height: 100,
// //                           width: double.infinity,
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(16),
// //                             border: Border.all(color: Colors.black45),
// //                           ),
// //                           child: ListTile(
// //                             title: Text(
// //                               'Name: ${address.name}',
// //                               style: TextStyle(fontSize: 16),
// //                             ),
// //                             subtitle: Column(
// //                               mainAxisAlignment: MainAxisAlignment.start,
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text('Address: ${address.address}'),
// //                                 Text('Mobile: ${address.mobile}'),
// //                               ],
// //                             ),
// //                             trailing: Row(
// //                               mainAxisSize: MainAxisSize.min,
// //                               children: [
// //                                 IconButton(
// //                                   icon: Icon(Icons.edit, color: Colors.green),
// //                                   onPressed: () {
// //                                     _showEditDialog(context, address);
// //                                   },
// //                                 ),
// //                                 IconButton(
// //                                   icon: Icon(Icons.delete, color: Colors.red),
// //                                   onPressed: () {
// //                                     _deleteAddress(address);
// //                                   },
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       InkWell(
// //                         onTap: () async {
// //                           await dbHelperShipping.updateAddress(
// //                             ShippingAddress(
// //                               id: address.id,
// //                               name: nameControl.text,
// //                               address: addresControl.text,
// //                               mobile: mobileConlol.text,
// //                             ),
// //                           );
// //
// //                          // Navigator.pop(context);
// //                         },
// //                         child: Padding(
// //                           padding: const EdgeInsets.only(top: 25.0),
// //                           child: Container(
// //                             height: 60,
// //                             width: 200,
// //                             decoration: BoxDecoration(
// //                               borderRadius: BorderRadius.circular(20),
// //                               border: Border.all(color: Colors.black45),
// //                               color: Colors.green,
// //                             ),
// //                             child: Center(child: Text('Update Address')),
// //                           ),
// //                         ),
// //                       )
// //                     ],
// //                   );
// //                 },
// //               );
// //             }
// //           },
// //         ),
// //       ),
// //     );
// //   }
// //
// //   void _editAddress(ShippingAddress address) {
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => EditAddressScreen(address: address),
// //       ),
// //     );
// //   }
// //
// //   void _deleteAddress(ShippingAddress address) async {
// //     dbHelperShipping.delete(address.id!);
// //     _refreshAddressList();
// //   }
// //
// //   void _showEditDialog(BuildContext context, ShippingAddress address) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text('Edit User'),
// //           content: Column(
// //             children: [
// //               TextField(
// //                 controller: nameControl,
// //                 decoration: InputDecoration(labelText: 'Name'),
// //               ),
// //               TextField(
// //                 controller: addresControl,
// //                 decoration: InputDecoration(labelText: 'Address'),
// //               ),
// //               TextField(
// //                 controller: mobileConlol,
// //                 decoration: InputDecoration(labelText: 'Mobile'),
// //               ),
// //             ],
// //           ),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.pop(context);
// //               },
// //               child: Text('Cancel'),
// //             ),
// //             TextButton(
// //               onPressed: () async {
// //                 address.name = nameControl.text;
// //                 address.address = addresControl.text;
// //                 address.mobile = mobileConlol.text;
// //
// //                 await dbHelperShipping.updateAddress(address);
// //                 _refreshAddressList();
// //                 Navigator.pop(context);
// //               },
// //               child: Text('Save'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }
// //
// // class EditAddressScreen extends StatefulWidget {
// //   final ShippingAddress address;
// //
// //   EditAddressScreen({required this.address});
// //
// //   @override
// //   _EditAddressScreenState createState() => _EditAddressScreenState();
// // }
// //
// // class _EditAddressScreenState extends State<EditAddressScreen> {
// //   TextEditingController nameControl = TextEditingController();
// //   TextEditingController addresControl = TextEditingController();
// //   TextEditingController mobileConlol = TextEditingController();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     nameControl.text = widget.address.name!;
// //     addresControl.text = widget.address.address!;
// //     mobileConlol.text = widget.address.mobile!;
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Edit Address'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             TextField(
// //               controller: nameControl,
// //               decoration: InputDecoration(labelText: 'Name'),
// //             ),
// //             TextField(
// //               controller: addresControl,
// //               decoration: InputDecoration(labelText: 'Address'),
// //             ),
// //             TextField(
// //               controller: mobileConlol,
// //               decoration: InputDecoration(labelText: 'Mobile'),
// //             ),
// //             SizedBox(height: 16),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 widget.address.name = nameControl.text;
// //                 widget.address.address = addresControl.text;
// //                 widget.address.mobile = mobileConlol.text;
// //
// //                 await DBHelperShipping().updateAddress(widget.address);
// //                 Navigator.pop(context);
// //               },
// //               child: Text('Save'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
// /////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:shahbaz_garments_app/domain/shipping_addres_database.dart';
// import 'package:shahbaz_garments_app/ui/provider/shipping_addres_provider.dart';
//
// import '../../data/model/shipping_address_model.dart';
//
// class DeliveryAddressScreen extends StatefulWidget {
//   const DeliveryAddressScreen({Key? key}) : super(key: key);
//
//   @override
//   State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
// }
//
// class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
//    List<ShippingAddress>? _addressList;
//   ShippingAddressProvider shippingAddressProvider = ShippingAddressProvider();
//   DBHelperShipping dbHelperShipping = DBHelperShipping();
//   TextEditingController nameControl = TextEditingController();
//   TextEditingController addresControl = TextEditingController();
//   TextEditingController mobileConlol = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     _refreshAddressList();
//   }
//
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
//       appBar: AppBar(
//         backgroundColor: Colors.green,
//         title: Text('Edit Address'),
//         // Add a back arrow to the app bar
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 120, right: 8, left: 8),
//         child: ListView.builder(
//           itemCount: _addressList!.length,
//           itemBuilder: (context, index) {
//             final address = _addressList![index];
//             return Column(
//               children: [
//                 Card(
//                   elevation: 2,
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: Container(
//                     height: 100,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16),
//                       border: Border.all(color: Colors.black45),
//                     ),
//                     child: ListTile(
//                       title: Text(
//                         'Name: ${address.name}',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       subtitle: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Address: ${address.address}'),
//                           Text('Mobile: ${address.mobile}'),
//                         ],
//                       ),
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.edit, color: Colors.green),
//                             onPressed: () {
//                               _showEditDialog(context, address);
//                             },
//                           ),
//                           IconButton(
//                             icon: Icon(Icons.delete, color: Colors.red),
//                             onPressed: () {
//                               _deleteAddress(address);
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 // InkWell(
//                 //   onTap: () async {
//                 //     await dbHelperShipping.updateAddress(
//                 //       ShippingAddress(
//                 //         id: address.id,
//                 //         name: nameControl.text,
//                 //         address: addresControl.text,
//                 //         mobile: mobileConlol.text,
//                 //       ),
//                 //     );
//                 //
//                 //     _refreshAddressList();
//                 //   },
//                 //   child: Padding(
//                 //     padding: const EdgeInsets.only(top: 25.0),
//                 //     child: Container(
//                 //       height: 60,
//                 //       width: 200,
//                 //       decoration: BoxDecoration(
//                 //         borderRadius: BorderRadius.circular(20),
//                 //         border: Border.all(color: Colors.black45),
//                 //         color: Colors.green,
//                 //       ),
//                 //       child: Center(child: Text('Update Address')),
//                 //     ),
//                 //   ),
//                 // )
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   void _deleteAddress(ShippingAddress address) async {
//     dbHelperShipping.delete(address.id!);
//     _refreshAddressList();
//   }
//
//   void _showEditDialog(BuildContext context, ShippingAddress address) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Edit User'),
//           content: Column(
//             children: [
//               TextField(
//                 controller: nameControl,
//                 decoration: InputDecoration(labelText: 'Name'),
//               ),
//               TextField(
//                 controller: addresControl,
//                 decoration: InputDecoration(labelText: 'Address'),
//               ),
//               TextField(
//                 controller: mobileConlol,
//                 decoration: InputDecoration(labelText: 'Mobile'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 address.name = nameControl.text;
//                 address.address = addresControl.text;
//                 address.mobile = mobileConlol.text;
//
//                 await dbHelperShipping.updateAddress(address);
//                 _refreshAddressList();
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class EditAddressScreen extends StatefulWidget {
//   final ShippingAddress address;
//
//   EditAddressScreen({required this.address});
//
//   @override
//   _EditAddressScreenState createState() => _EditAddressScreenState();
// }
//
// class _EditAddressScreenState extends State<EditAddressScreen> {
//   TextEditingController nameControl = TextEditingController();
//   TextEditingController addresControl = TextEditingController();
//   TextEditingController mobileConlol = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     nameControl.text = widget.address.name!;
//     addresControl.text = widget.address.address!;
//     mobileConlol.text = widget.address.mobile!;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Address'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameControl,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: addresControl,
//               decoration: InputDecoration(labelText: 'Address'),
//             ),
//             TextField(
//               controller: mobileConlol,
//               decoration: InputDecoration(labelText: 'Mobile'),
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () async {
//                 widget.address.name = nameControl.text;
//                 widget.address.address = addresControl.text;
//                 widget.address.mobile = mobileConlol.text;
//
//                 await DBHelperShipping().updateAddress(widget.address);
//                 Navigator.pop(context);
//               },
//               child: Text('Save'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shahbaz_garments_app/domain/shipping_addres_database.dart';
import 'package:shahbaz_garments_app/ui/provider/shipping_addres_provider.dart';

import '../../data/model/shipping_address_model.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  List<ShippingAddress>? _addressList; // Updated

  DBHelperShipping dbHelperShipping = DBHelperShipping();
  TextEditingController nameControl = TextEditingController();
  TextEditingController addresControl = TextEditingController();
  TextEditingController mobileControl = TextEditingController(); // Updated

  @override
  void initState() {
    super.initState();
    _refreshAddressList();
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
        title: Text('Edit Address'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 120, right: 8, left: 8),
        child: ListView.builder(
          itemCount: _addressList?.length ?? 0, // Updated
          itemBuilder: (context, index) {
            final address = _addressList![index]; // Updated
            return Column(
              children: [
                Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black45),
                    ),
                    child: ListTile(
                      title: Text(
                        'Name: ${address.name}',
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Address: ${address.address}'),
                          Text('Mobile: ${address.mobile}'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.green),
                            onPressed: () {
                              _showEditDialog(context, address);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteAddress(address);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _deleteAddress(ShippingAddress address) async {
    dbHelperShipping.delete(address.id!);
    _refreshAddressList();
  }

  void _showEditDialog(BuildContext context, ShippingAddress address) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit User'),
          content: Column(
            children: [
              TextField(
                controller: nameControl,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: addresControl,
                decoration: InputDecoration(labelText: 'Address'),
              ),
              TextField(
                controller: mobileControl,
                decoration: InputDecoration(labelText: 'Mobile'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                address.name = nameControl.text;
                address.address = addresControl.text;
                address.mobile = mobileControl.text;

                await dbHelperShipping.updateAddress(address);
                _refreshAddressList();
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
