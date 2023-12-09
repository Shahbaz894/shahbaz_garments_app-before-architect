//  import 'package:badges/badges.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart' ;
// import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
// import 'package:provider/provider.dart';
// import 'package:shahbaz_garments_app/ui/provider/product_search_provider.dart';
// import 'package:shahbaz_garments_app/ui/screen/product_grid_view_screen.dart';
// import 'package:shahbaz_garments_app/ui/screen/profile_screen.dart';
// import 'package:shahbaz_garments_app/ui/screen/search_product_screen.dart';
//
// import '../../data/repository/product_reppository.dart';
// import '../component/bottom_navigation_bar.dart';
// import '../component/custom_drawer.dart';
// import '../component/product_card.dart';
// import '../provider/bottom_bar_provider.dart';
// import 'corsal_slider.dart';
//  import 'package:badges/badges.dart' as badges;
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int currentIndex = 0;
//   final PageController controller = PageController();
//
//   List<String> images = [
//     "https://picsum.photos/id/240/200/300",
//     "https://picsum.photos/id/241/200/300",
//     "https://picsum.photos/id/242/200/300",
//     "https://picsum.photos/id/243/200/300",
//     "https://picsum.photos/id/244/200/300",
//     "https://picsum.photos/id/250/200/300",
//     "https://picsum.photos/id/251/200/300",
//     "https://picsum.photos/id/252/200/300",
//     "https://picsum.photos/id/253/200/300",
//     "https://picsum.photos/id/254/200/300",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final myProductProvider = Provider.of<MyProductProvider>(context);
//     TextEditingController searchController=TextEditingController();
//     final imageUrl = myProductProvider.myDataList;
//     //SearchProductScreen searchProductScreen=SearchProductScreen();
//
//     CorsalSliderScreen corsalSliderScreen=CorsalSliderScreen();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor:Colors.green ,
//
//
//
//
//       ),
//
//        drawer:CustomDrawer(),
//
//
//
//        body:Column(children: [
//
//
//
//          Text('What would you like\n to order?',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 26),),
//
//          SizedBox(height: 20,),
//          const Align(
//            alignment: Alignment.topLeft,
//              child: Text('Recommended Item',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
//          SizedBox(height: 5,),
//          Expanded(child: corsalSliderScreen),
//
//          const Align(
//              alignment: Alignment.topLeft,
//              child: Text('Top Rated Item',style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),)),
//          const SizedBox(height: 3,),
//         Expanded(child: ProductGridViewScreen()),
//
//
//           MyBottomNavigationBar(),
//
//
//
//        ],)
//
//     );
//   }
//
//   Widget buildIndicator(bool isSelected) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 1),
//       child: Container(
//         height: isSelected ? 12 : 10,
//         width: isSelected ? 12 : 10,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: isSelected ? Colors.black : Colors.grey,
//         ),
//       ),
//     );
//   }
// }

import 'package:badges/badges.dart 'as badges;
import 'package:badges/badges.dart%20';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahbaz_garments_app/ui/provider/product_cart_provider.dart';
import 'package:shahbaz_garments_app/ui/provider/product_search_provider.dart';
import 'package:shahbaz_garments_app/ui/screen/product_grid_view_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/profile_screen.dart';

import '../../data/repository/product_reppository.dart';
import '../component/bottom_navigation_bar.dart';
import '../component/custom_drawer.dart';
import '../component/product_card.dart';
import 'corsal_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int currentIndex = 0;
  final PageController controller = PageController();

  List<String> images = [
    "https://picsum.photos/id/240/200/300",
    "https://picsum.photos/id/241/200/300",
    "https://picsum.photos/id/242/200/300",
    "https://picsum.photos/id/243/200/300",
    "https://picsum.photos/id/244/200/300",
    "https://picsum.photos/id/250/200/300",
    "https://picsum.photos/id/251/200/300",
    "https://picsum.photos/id/252/200/300",
    "https://picsum.photos/id/253/200/300",
    "https://picsum.photos/id/254/200/300",
  ];

  @override
  Widget build(BuildContext context) {
    final myProductProvider = Provider.of<MyProductProvider>(context);
    final prCartProvider= Provider.of<ProductCartProvider>(context);
    TextEditingController searchController = TextEditingController();
    final imageUrl = myProductProvider.myDataList;

    CorsalSliderScreen corsalSliderScreen = CorsalSliderScreen();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        actions: [
          // Drawer Icon with Badge
          badges.Badge(
            badgeContent:  Text( prCartProvider.getCounter().toString(),// Replace with the actual badge count
              style: TextStyle(color: Colors.white),
            ),
            position: BadgePosition.topEnd(top: 0, end: 3),
            child: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Handle drawer button tap
                //Scaffold.of(context).openDrawer();
              },
            ),
          ),
          // Add other actions if needed
        ],
      ),
      drawer: CustomDrawer(),
      body: Column(
        children: [
          Text(
            'What would you like\n to order?',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 26),
          ),
          SizedBox(height: 20),
          const Align(
            alignment: Alignment.topLeft,
            child: Text('Recommended Item', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 5),
          Expanded(child: corsalSliderScreen),
          const Align(
            alignment: Alignment.topLeft,
            child: Text('Top Rated Item', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 3),
          Expanded(child: ProductGridViewScreen()),
          MyBottomNavigationBar(),
        ],
      ),
    );
  }
}
