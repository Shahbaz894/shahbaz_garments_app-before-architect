
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shahbaz_garments_app/ui/screen/auth_screen/verify_code_screen.dart';

import '../../../uitils/utils.dart';
import '../widget/round_button.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  TextEditingController phoneController=TextEditingController();
  final  auth=FirebaseAuth.instance;
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Login With Phone No'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,


                decoration: InputDecoration(
                  hintText: '+92 3327332894',
                  border: OutlineInputBorder( // Border style
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder( // Border style when the field is focused
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                )
            ),
            SizedBox(height: 50,),
            RoundButton(title: 'Add Phone No',
                loading: loading,
                onTap: (){
                  setState(() {
                    loading=true;
                  });
                  auth.verifyPhoneNumber(
                      phoneNumber: phoneController.text,
                      verificationCompleted: (_){
                        setState(() {
                          loading=false;
                        });
                      },
                      verificationFailed: (e){
                        setState(() {
                          loading=false;
                        });
                        Utilis().toastMessage(e.toString());
                      },
                      codeSent: (String verifiactionId,int? token){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=> VerifyCode(
                              verifcationId:verifiactionId ,
                            )));
                        setState(() {
                          loading=false;
                        });

                      },
                      codeAutoRetrievalTimeout:(e){
                        Utilis().toastMessage(e.toString());
                        setState(() {
                          loading=false;
                        });
                      } );

                })
          ],
        ),
      ),
    );
  }
}
// sub say phle directory change karni hn jahn JDK install kia h phr usk bad nechy wali comand paste karni h
//cd D:\jdk-20_windows-x64_bin\jdk-20\bin
//
//C:\Users\lenovo\.android
//keytool -list -v -keystore "C:\Users\lenovo\.android\debug.keystore" -alias androiddebugkey -storepass android -keypass android
//SHA1: 07:8C:00:E8:CA:84:93:2A:85:F1:B3:95:96:D7:47:3E:E5:E3:5D:FD
//   SHA256: 14:67:0B:4F:57:B7:FD:7B:96:57:E0:4B:A2:2B:7D:D3:A9:13:7D:F7:03:EE:80:FB:24:F9:92:39:EE:D9:9E:73