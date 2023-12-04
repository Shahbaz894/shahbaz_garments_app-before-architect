
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

                decoration: InputDecoration(
                  hintText: '6 digit code',
                  border: OutlineInputBorder( // Border style
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder( // Border style when the field is focused
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                )
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