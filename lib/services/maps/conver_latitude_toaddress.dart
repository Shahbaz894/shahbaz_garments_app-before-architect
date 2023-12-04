import 'package:flutter/material.dart';
import 'package:flutter_geocoder/geocoder.dart';

class ConvertLatLangToAddress extends StatefulWidget {
  const ConvertLatLangToAddress({Key? key}) : super(key: key);

  @override
  _ConvertLatLangToAddressState createState() => _ConvertLatLangToAddressState();
}

class _ConvertLatLangToAddressState extends State<ConvertLatLangToAddress> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body:  const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Column(
              children: <Widget>[
                Text('latitude: 37.597576, longitude: 55.771899'),
                //   Text(address),
              ],
            ),
            SizedBox(height: 40),
            Column(
              children: <Widget>[
                Text('address: Москва, 4-я Тверская-Ямская улица, 7'),
                //Text(latLong),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          // From coordinates
          // final coordinates = new Coordinates(33.6992, 72.9744);
          // final addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
          // final first = addresses.first;
          // print("${first.featureName} : ${first.addressLine}");

          // From a query
          final query = "rahim yar khan";
          var add = await Geocoder.local.findAddressesFromQuery(query);
          var second = add.first;
          print("${second.featureName} : ${second.coordinates}");
          setState(() {});
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
