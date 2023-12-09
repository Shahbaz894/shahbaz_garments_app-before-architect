
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../rogh.dart';
import '../../../uitils/utils.dart';

import '../home_screen.dart';
import '../widget/round_button.dart';

class VerifyCode extends StatefulWidget {
  final String verifcationId;
  const VerifyCode({ required this.verifcationId ,super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  TextEditingController verificationCodeController=TextEditingController();
  final  auth=FirebaseAuth.instance;
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Verify Code'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            TextFormField(
              controller: verificationCodeController,
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: '6-digit code',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)), // Adjust hint text color
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.red),
                ),
                prefixIcon: Icon(
                  Icons.security,
                  color: Colors.grey,
                ),
              ),
            ),

            SizedBox(height: 50,),
            RoundButton(title: 'Verify', loading: loading, onTap: () async{
              setState(() {
                loading=true;
              });
              final credentialToken=PhoneAuthProvider.credential(
                verificationId: widget.verifcationId,
                smsCode: verificationCodeController.text.toString(),
              );
              try{
                await auth.signInWithCredential(credentialToken);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=> HomePage()));

              }catch(e){
                Utilis().toastMessage(e.toString());

                setState(() {
                  loading=false;
                });

              }

            })




          ],
        ),
      ),
    );
  }
}