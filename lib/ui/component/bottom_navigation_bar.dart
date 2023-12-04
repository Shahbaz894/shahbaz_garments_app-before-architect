import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahbaz_garments_app/ui/screen/cart_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/favorites_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/map_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/my_orders.dart';
import 'package:shahbaz_garments_app/ui/screen/profile_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/search_product_screen.dart';
import 'package:badges/badges.dart' as badges;
import '../provider/bottom_bar_provider.dart';
import '../provider/product_cart_provider.dart';

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selectedItem = Provider.of<SelectedNavItem>(context);
    final cart = Provider.of<ProductCartProvider>(context);

    return BottomNavigationBar(
      currentIndex: selectedItem.selectedItem,
      onTap: (index) {
        selectedItem.setSelectedItem(index);
      },
      items: [

        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.search, color: selectedItem.selectedItem == 1? Colors.green : Colors.grey), // Change the color here
            // onPressed: () => selectedItem.setSelectedItem(1),
            onPressed: (){
              selectedItem.setSelectedItem(1);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchProductScreen()));
            },
          ),
          label: 'Profile',
        ),

        BottomNavigationBarItem(
          icon: IconButton(

            icon: Icon(Icons.notification_add, color: selectedItem.selectedItem == 2 ? Colors.green : Colors.grey), // Change the color here
            // onPressed: () => selectedItem.setSelectedItem(1),
            onPressed: (){
              selectedItem.setSelectedItem(2);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyOrders()));
            },
          ),
          label: 'Notification',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(Icons.favorite, color: selectedItem.selectedItem == 3? Colors.green : Colors.grey), // Change the color here
            // onPressed: () => selectedItem.setSelectedItem(1),
            onPressed: (){
              selectedItem.setSelectedItem(3);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteScreen()));
            },
          ),
          label: 'Favorite',
        ),
        // BottomNavigationBarItem(
        //   icon: IconButton(
        //     icon: Icon(Icons.maps_ugc, color: selectedItem.selectedItem == 4? Colors.green : Colors.grey), // Change the color here
        //     // onPressed: () => selectedItem.setSelectedItem(1),
        //     onPressed: (){
        //       selectedItem.setSelectedItem(4);
        //       Navigator.push(context, MaterialPageRoute(builder: (context)=>GoogMapScreen()));
        //     },
        //   ),
        //   label: 'Track Order',
        // ),
      ],
    );
  }
}