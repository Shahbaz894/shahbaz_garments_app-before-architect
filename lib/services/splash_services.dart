import 'dart:async';


import 'package:flutter/material.dart';
import 'package:shahbaz_garments_app/ui/screen/welcom_screen.dart';

class SplashServices{

void isLogin(BuildContext context){
  Timer(Duration(seconds: 3), () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>const WelcomeScreen()));


  });
}

  
}