import 'package:flutter/material.dart';
import 'package:shahbaz_garments_app/ui/screen/cart_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/dlivery_address_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/profile_screen.dart';

import '../screen/my_orders.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
           UserAccountsDrawerHeader(
            accountName: Text("Shahbaz zuilfiqar"), // Replace with the user's name
            accountEmail: Text("johndoe@example.com"), // Replace with the user's email
            currentAccountPicture: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/bird.jpg"),
                radius: 40,// Replace with the user's profile image
              ),
            ),

            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle home button tap
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () {
              // Handle search button tap
            },
          ),
          ListTile(
            leading: Icon(Icons.transfer_within_a_station),
            title: const Text('Order'),
            onTap: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> MyOrders()));
            },
          ),
          ListTile(

            leading: Icon(Icons.shopping_cart),
            title: Text('Cart Screen'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle settings button tap
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {
              // Handle help button tap
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              // Handle logout button tap
            },
          ),
        ],
      ),
    );
  }
}
