
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shahbaz_garments_app/ui/screen/payment_screen.dart';
import '../../data/model/shipping_address_model.dart';
import '../../domain/shipping_addres_database.dart';
import '../provider/shipping_addres_provider.dart';

class ShippingAddressScreen extends StatefulWidget {
  ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  _ShippingAddressScreenState createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  DBHelperShipping dbHelperShipping = DBHelperShipping();

  @override
  Widget build(BuildContext context) {
    final shippingAddressProvider =
    Provider.of<ShippingAddressProvider>(context);
    final orderNumber = generateOrderNumber();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Shipping Address',
            style: TextStyle(fontSize: 20),
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 8,
            right: 8,
            bottom: 8
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    labelText: 'Address',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                ),
                child: TextFormField(
                  controller: mobileController,
                  decoration: const InputDecoration(
                    labelText: 'Mobile no',
                    border: InputBorder.none,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [Colors.green, Colors.lightGreen],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentScreen()));
                    if (_validateForm()) {
                      _saveAddress(orderNumber);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                  ),
                  child: const Text(
                    'Save Address',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),

              // Container(
              //   height: 50,
              //   width: 200,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(30),
              //     color: Colors.green,
              //   ),
              //   child: ElevatedButton(
              //     onPressed: () {
              //       if (_validateForm()) {
              //         _saveAddress(orderNumber);
              //       }
              //     },
              //     child: const Text('Save Address', style: TextStyle(fontSize: 15)),
              //   ),
              // ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    if (nameController.text.isEmpty ||
        addressController.text.isEmpty ||
        mobileController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Please fill in all fields.'),
          duration: Duration(seconds: 2),
        ),
      );
      return false;
    }
    return true;
  }

  void _saveAddress(String orderNumber) {
    if (dbHelperShipping != null) {
      dbHelperShipping!
          .insert(
        ShippingAddress(
          name: nameController.text,
          address: addressController.text,
          mobile: mobileController.text,
          orderNumber: orderNumber,
        ),
      )
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Address is added'),
            duration: Duration(seconds: 1),
          ),
        );
      }).onError((error, stackTrace) {
        print("error" + error.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Address is already stored'),
            duration: Duration(seconds: 1),
          ),
        );
      });
    }
  }

  String generateOrderNumber() {
    final now = DateTime.now();
    final random = Random().nextInt(10000);
    return 'ORD-${now.year}${now.month}${now.day}-$random';
  }
}
