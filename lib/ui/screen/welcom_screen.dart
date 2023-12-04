import 'package:flutter/material.dart';
import 'package:shahbaz_garments_app/ui/screen/auth_screen/login_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/auth_screen/login_with_phone.dart';
import 'package:shahbaz_garments_app/ui/screen/home_screen.dart';
import 'package:shahbaz_garments_app/ui/screen/widget/facebook_button.dart';
import 'package:shahbaz_garments_app/ui/screen/widget/google_signin_button.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/back.jpg'), // Replace with your image path
              fit: BoxFit.cover, // You can adjust this to BoxFit.fill, BoxFit.fitWidth, etc.
            ),
          ),
          child:  Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 120.0),
                  child: Center(
                    child: Text(
                      'Welcome to Sz\nGarments',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ),
                ),
              Padding(padding: EdgeInsets.only(top: 350),
              child: Column(children: [
                // const Center(
                //     child: Text('---SingIn with--- ',style: TextStyle(color: Colors.black,fontSize: 20),)),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black, // Adjust the color as needed
                        thickness: 1, // Adjust the thickness as needed
                        height: 1, // Adjust the height as needed
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'SignIn with',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black, // Adjust the color as needed
                        thickness: 1, // Adjust the thickness as needed
                        height: 1, // Adjust the height as needed
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 50,),
                Row(
                  children: [

                    facebookSignInButton(
                      onPressed: () {
                        // Your code for handling the Facebook sign-in goes here
                      },
                    ),
                    const SizedBox(width: 90,),
                    googleSignInButton(
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                    ),


                    // Other widgets
                  ],
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white54
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginWithPhone()));
                      },
                        child: Center(
                            child: Text('start with email or phone',style: TextStyle(color: Colors.purple,fontSize: 20),))),
                  ),
                ),
                SizedBox(height: 20,),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                },
                    child: Text('Already SignIn? Sign in',style: TextStyle(color: Colors.white,fontSize: 20),))
              ],),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
