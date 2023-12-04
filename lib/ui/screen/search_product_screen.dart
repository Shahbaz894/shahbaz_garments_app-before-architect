// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shahbaz_garments_app/ui/screen/product_detail_screen.dart';
//
// import '../provider/product_search_provider.dart';
//
// class SearchProductScreen extends StatefulWidget {
//   final String? query;
//
//   const SearchProductScreen({Key? key, required this.query}) : super(key: key);
//
//   @override
//   State<SearchProductScreen> createState() => _SearchProductScreenState();
// }
//
// class _SearchProductScreenState extends State<SearchProductScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ProductSearchProvider>(context, listen: false)
//         .fetchProducts(widget.query.toString());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final productProvider =
//     Provider.of<ProductSearchProvider>(context, listen: true);
//     final products = productProvider.products;
//
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product List'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: productProvider.products.isEmpty
//                 ? Center(child: CircularProgressIndicator(color: Colors.red))
//                 : ListView.builder(
//               itemCount: products.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Container(
//                     height: 190,
//                     width: 100,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.green)),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => ProductDetailScreen(
//                                   title: products[index].title
//                                       .substring(0, 18),
//                                   productImage: products[index]
//                                       .image
//                                       .toString(),
//                                   productPrice:
//                                   products[index].price,
//                                   //productDescription: product.description.toString(),
//                                 ),
//                               ),
//                             );
//                           },
//                           child: Image.network(
//                             products[index].image.toString(),
//                             height: 150,
//                             width: 150,
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Text(products[index].title.substring(0, 18)),
//                               Spacer(),
//                               Text('\$${products[index].price.toString()}'),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';
import 'package:shahbaz_garments_app/ui/screen/product_detail_screen.dart';

import '../provider/product_search_provider.dart';

class SearchProductScreen extends StatefulWidget {

  const SearchProductScreen({super.key});

  @override
  State<SearchProductScreen> createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductSearchProvider>(context);
    final products = productProvider.products;


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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child:
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
              child: TextFormField(
                onChanged: (query) {
                  productProvider.fetchProducts(query);
                },
                decoration:
                 InputDecoration(

                  labelText: 'Search Product',
                  hintText: 'Enter product name...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: productProvider.products.isEmpty
                ? Center(child: CircularProgressIndicator(color: Colors.red,))
                : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 190,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.green)
                    ),
                    child: Column(
                      children: [

                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(
                                  title: products[index].title.substring(0,18),
                                  productImage: products[index].image.toString(),
                                  productPrice: products[index].price,
                                  //productDescription: product.description.toString(),
                                ),
                              ),
                            );
                          },
                          child: Image.network(

                            products[index].image.toString(),
                            height: 150,
                            width: 150,
                            // You can add additional properties like width, height, fit, etc.
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(products[index].title.substring(0,18)),
                              Spacer(),
                              Text('\$${products[index].price.toString()}'),

                            ],
                          ),
                        )

                      ],),
                  ),
                );
                //   ListTile(
                //   title: Text(products[index].title),
                //   subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}