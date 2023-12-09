 import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';
import 'package:shahbaz_garments_app/services/firebase_configuration.dart';
import 'package:shahbaz_garments_app/services/maps/conver_latitude_toaddress.dart';
import 'package:shahbaz_garments_app/services/upload_image_camera.dart';
import 'package:shahbaz_garments_app/ui/design.dart';

import 'package:shahbaz_garments_app/ui/provider/bottom_bar_provider.dart';
import 'package:shahbaz_garments_app/ui/provider/favorite_product_provider.dart';

import 'package:shahbaz_garments_app/ui/provider/product_cart_provider.dart';
import 'package:shahbaz_garments_app/ui/provider/product_search_provider.dart';
import 'package:shahbaz_garments_app/ui/provider/profile_provider.dart';
import 'package:shahbaz_garments_app/ui/provider/shipping_addres_provider.dart';

import 'package:shahbaz_garments_app/ui/screen/home_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/splash_screen.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'data/repository/product_reppository.dart';





void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Configurations configurations=Configurations();
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: configurations.apiKey,
          appId: configurations.appId,
          messagingSenderId: configurations.messagingSenderId,
          projectId: configurations.projectId,
          storageBucket: configurations.storageBucket

      )

  );

  //final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();





  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => MyProductProvider()),

          ChangeNotifierProvider(create: (_) => SelectedNavItem()),
          ChangeNotifierProvider(create: (_) => ProductCartProvider()),
          ChangeNotifierProvider(create: (_) => FavoritesProductProvider()),
          ChangeNotifierProvider(create: (_) => ShippingAddressProvider()),
          ChangeNotifierProvider(create: (_) => ProfileProvider()),
          ChangeNotifierProvider(create: (_) => ProductSearchProvider()),



        ],

        child: MyApp(),)
  );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return      MaterialApp(
      debugShowCheckedModeBanner: false,

      //home:  CurrentLocationScreen(),home: ConvertLatLangToAddress(),
      // home: GoogleMapServices(),
      //home:CheckOutScreen()
      // home:CreditCardScreen()
     //home: CorsalSliderScreen(),
     // home: ProductGridViewScreen()
     // home:SearchProductScreen(),
      //home: CartScreen(),
      //home: FavoriteScreen(),
      // home:GoogMapScreen()
     // home: ConvertLatLangToAddress(),
      //home:  HomePage(),
      //home: ShippingAddressScreen(),
      //home: DeliveryAddressScreen(),
     home: SplashScreen(),
     //home: SignUpScreen(),
     // home: PaymentScreen(),
     // home: MyOrders(),
    );
  }
}

