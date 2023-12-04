


import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

import 'package:shahbaz_garments_app/domain/db_profile.dart';
import 'package:shahbaz_garments_app/ui/provider/profile_provider.dart';

import '../../data/model/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
   File? _image;
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Post'); // Reference to your Firebase Realtime Database
  DBProfile dbProfile=DBProfile();
  // Function to open the camera and capture a photo
  Future<void> _capturePhoto() async {
    final image = await _imagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    final pfProvider=Provider.of<ProfileProvider>(context);
    return Scaffold(


      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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

                Positioned(
                  top: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                    onPressed: () {
                      // Navigate back to the first screen
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            const Text(
              'Shahbaz Zulfiqar',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Colors.black12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: _image != null
                        ? Image.file(_image!, fit: BoxFit.cover)
                        : Image.asset('assets/baby.jpg', fit: BoxFit.cover),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    // Add your camera icon functionality here
                    _capturePhoto();
                    if (_image != null) {
                      final ref = storage.ref('/asiftaj/${DateTime.now().millisecondsSinceEpoch}');
                      final uploadTask = ref.putFile(_image!);
                      await uploadTask.whenComplete(() async {
                        final newUrl = await ref.getDownloadURL();

                        // Store user data in Firebase Realtime Database
                        databaseRef.push().set({

                          'profile_image_url': newUrl.toString(),
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                           const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Image uploaded and data saved successfully'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Failed to upload image and save data'),
                              duration: Duration(seconds: 1),
                            ));
                            return Future.value(null); // Return a Future containing null
                      });




                    }
                  },
                  icon: Icon(
                    Icons.camera_alt_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Text('shahbazzulfiqar@gmail.com'),
            SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),

            // InkWell(
            //   onTap: () {
            //     if(dbProfile!=null) {
            //       dbProfile!.insert(
            //           ProfileModel(
            //
            //             title: usernameController.text,
            //             mobile: phoneNumberController.text as int,
            //
            //
            //             //rating: product.rating,
            //
            //           )
            //       ).then((value) {
            //         // pfProvider.addProfile(
            //         //     profile);
            //         // cartProvider.addTotalPrice(
            //         //     product.price!.toDouble());
            //         // cartProvider.addCounter();
            //
            //         final snackBar = const SnackBar(
            //           backgroundColor: Colors.green,
            //           content: Text('Product is added to cart'),
            //           duration: Duration(seconds: 1),);
            //
            //         ScaffoldMessenger.of(context).showSnackBar(
            //             snackBar);
            //       }).onError((error, stackTrace) {
            //         print("error" + error.toString());
            //         final snackBar = const SnackBar(
            //             backgroundColor: Colors.red,
            //             content: Text(
            //                 'Product is already added in cart'),
            //             duration: Duration(seconds: 1));
            //
            //         ScaffoldMessenger.of(context).showSnackBar(
            //             snackBar);
            //       });
            //       ;
            //     }
            //   },
            //   child: Container(
            //     height: 60,
            //     width: 370,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(20),
            //       color: Colors.green,
            //     ),
            //     child: Center(
            //       child: Text('Save', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
