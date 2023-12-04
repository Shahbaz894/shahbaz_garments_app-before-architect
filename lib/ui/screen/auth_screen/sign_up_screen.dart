
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:shahbaz_garments_app/ui/design.dart';

import '../../../uitils/utils.dart';
import '../widget/custom_quadrant_desing.dart';
import '../widget/round_button.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  final _formkey=GlobalKey<FormState>();
  FirebaseAuth _auth=FirebaseAuth.instance;
  bool _isObsecurePassword=true;
  bool isLoading=false;
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
    return  Scaffold(
      body:
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
          Column(
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
                    SizedBox(height:20 ,),
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
                  ],
                ),),
              SizedBox(height: 20,),
              RoundButton(title: 'Sign Up',
                loading: isLoading,
                onTap: (){
                  if(_formkey.currentState!.validate()){
                    setState(() {
                      isLoading=true;
                    });
                    _auth.createUserWithEmailAndPassword(email: emailController.text.toString(),
                        password: passController.text.toString()).then((value){
                      setState(() {
                        isLoading=false;
                      });

                    }).onError((error, stackTrace){
                      Utilis().toastMessage(error.toString());
                      setState(() {
                        isLoading=false;
                      });
                    });
                  }
                },
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already Have a account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>const LoginScreen()));
                  }, child:const Text('Login'), )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
