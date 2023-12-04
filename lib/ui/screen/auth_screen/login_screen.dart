
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shahbaz_garments_app/ui/screen/auth_screen/sign_up_screen.dart';

import '../../../rogh.dart';
import '../../../services/signin_with_google.dart';
import '../../../uitils/utils.dart';

import '../home_screen.dart';
import '../widget/facebook_button.dart';
import '../widget/google_signin_button.dart';
import '../widget/round_button.dart';
import 'forgot_password_screen.dart';
import 'login_with_phone.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  final _formkey=GlobalKey<FormState>();
  bool _isObsecurePassword=true;
  bool loading=false;
  final _auth=FirebaseAuth.instance;
  void loging(){
    setState(() {
      loading=true;
    });
    _auth.signInWithEmailAndPassword(email: emailController.text.toString(),
        password: passController.text.toString()).
    then((value) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context)=>HomePage()));
      setState(() {
        loading=false;
      });
    }).onError((error, stackTrace) {
      Utilis().toastMessage(error.toString());
      setState(() {
        loading=false;
      });
    });
  }
  void _togglePasswordVisibilty(){
    setState(() {
      _isObsecurePassword = !_isObsecurePassword;
    });
  }
  @override
  void dispose(){
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          automaticallyImplyLeading: false,
          title: const Center(child: Text('Login Page')),
        ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 150,left: 8,right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Form(
                  key: _formkey,
                  child:  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration:  InputDecoration(
                            border: OutlineInputBorder( // Border style
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder( // Border style when the field is focused
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue),
                            ),


                            enabledBorder: OutlineInputBorder( // Border style when the field is not focused
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: 'Email',
                            helperText: 'enter email e.g @shahbazgmail.com',
                            prefixIcon: Icon(Icons.email)
                        ),
                        validator:(value){
                          if(value!.isEmpty){
                            return 'Enter your email address';
                          }
                          return null;


                        } ,
                      ),
                      SizedBox(height:15 ,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passController,
                        obscureText: _isObsecurePassword,
                        decoration: InputDecoration(
                            border: OutlineInputBorder( // Border style
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder( // Border style when the field is focused
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.blue),
                            ),


                            enabledBorder: OutlineInputBorder( // Border style when the field is not focused
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            //errorText: 'Invalid username', // Error message text
                            hintText: 'Password',
                            helperText: 'enter your password',
                            prefixIcon: Icon(Icons.email),
                            suffixIcon: IconButton(
                              icon: Icon(_isObsecurePassword?Icons.visibility:Icons.visibility_off),
                              onPressed: _togglePasswordVisibilty,


                            )

                        ),

                        validator:(value){
                          if(value!.isEmpty){
                            return 'Enter your password';
                          }
                          return null;


                        } ,
                      ),
                      SizedBox(height:1 ,),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=>const ForgetPasswordScreen()));
                          },
                          child: const Text('Forget Password?',style: TextStyle(color: Colors.blue,fontSize: 15),),
                        ),
                      )

                    ],
                  ),),
                SizedBox(height: 10,),
                RoundButton(title: 'Login',
                  loading: loading,
                  onTap: (){
                    if(_formkey.currentState!.validate()){
                      loging();


                    };
                  },
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have a account?"),
                    TextButton(onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=>const SignUpScreen()));
                    }, child:const Text('Sign Up'), )
                  ],
                ),
                const SizedBox(height: 15,),
                InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const LoginWithPhone()));

                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: Colors.black
                        ),
                        color: Colors.green


                    ),

                    child: const Center(child: Text('Login With Phone Number')),
                  ),
                ),
                SizedBox(height: 50,),
                const Text('Or Login With'),
                SizedBox(height: 50,),
                Row(
                  children: [

                    facebookSignInButton(
                      onPressed: () {
                        // Your code for handling the Facebook sign-in goes here
                      },
                    ),
                    SizedBox(width: 90,),
                    googleSignInButton(
                      onPressed: () {
                        // Your code for handling the Facebook sign-in goes here
                      },
                    ),

                    // Other widgets
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
