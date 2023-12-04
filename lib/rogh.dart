// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// // Import your custom ProductTitle widget
//
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final myProductProvider = Provider.of<MyProductProvider>(context);
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your App Name'),
//       ),
//       body:
//       ListView.builder(
//         itemCount: myProductProvider.myDataList.length,
//         itemBuilder: (context, index) {
//           final product = myProductProvider.myDataList[index];
//
//           return Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(100), // Creates an egg shape
//             ),
//             elevation: 5,
//             child: Column(
//               children: <Widget>[
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(100), // Clip the card to an egg shape
//                   child: Image.network(
//                     product.imageUrl, // Replace with actual image URL
//                     fit: BoxFit.cover,
//                     height: 200,
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ProductTitle(title: product.title),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
