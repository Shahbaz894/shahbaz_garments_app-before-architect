
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../rogh.dart';
import '../../../uitils/utils.dart';
import '../home_screen.dart';
import '../widget/round_button.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  TextEditingController fogetPasswordController=TextEditingController();
  bool loading=false;
  final _auth=FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Forget Password ',style: TextStyle(color: Colors.black,fontSize: 20),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: fogetPasswordController,
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
                  hintText: 'Enter your Email '
              ),

            ),
            SizedBox(height: 30,),
            RoundButton(title:'Forget Password', loading:loading,onTap: (){
              setState(() {
                loading=true;
              });
              _auth.sendPasswordResetEmail(email: fogetPasswordController.text.toString()).
              then((value){
                Utilis().toastMessage('We have Send a recovery email for password reset');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> HomePage()));
                setState(() {
                  loading=false;
                });
              }).onError((error, stackTrace){
                Utilis().toastMessage(error.toString());
                setState(() {
                  loading=false;
                });
              });
            })

          ],
        ),
      ),
    );
  }
}

