import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_map_polyline_new/google_map_polyline_new.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';


class GoogMapScreen extends StatefulWidget {
  const GoogMapScreen({Key? key});

  @override
  State<GoogMapScreen> createState() => _GoogMapScreenState();
}

class _GoogMapScreenState extends State<GoogMapScreen> {
  late GoogleMapController mapController;
  TextEditingController textEditingController = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.4212, 70.2989),
    zoom: 14,
  );
  Set<Marker> _markers = {};
  Set<Circle> _circles = {};

  GoogleMapPolyline _googleMapPolyline = GoogleMapPolyline(apiKey: 'AIzaSyCTeHWEBgR8v95h2XYjIoKMHlqYKbO-KeA');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _addMarker('Initial Marker', LatLng(28.4212, 70.2989));
  }

  Future<void> _addMarkerFromAddress(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        final Location location = locations.first;
        final double lat = location.latitude;
        final double lon = location.longitude;

        _markers.clear();
        _circles.clear();

        _addMarker(address, LatLng(lat, lon));
        _addCircle(LatLng(lat, lon));

        mapController.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lon)));

            // Calculate and draw directions
            await _drawDirections(const LatLng(28.4212, 70.2989), LatLng(lat, lon));

    setState(() {});
    } else {
    print('No location found for the provided address.');
    }
    } catch (e) {
    print('Error geocoding address: $e');
    }
  }

  void _addMarker(String markerId, LatLng position) {
    _markers.add(
      Marker(
        markerId: MarkerId(markerId),
        position: position,
        infoWindow: InfoWindow(
          title: markerId,
        ),
      ),
    );
  }

  void _addCircle(LatLng center) {
    _circles.add(
      Circle(
        circleId: CircleId(center.toString()),
        center: center,
        radius: 100, // 100 meters
        fillColor: Colors.blue.withOpacity(0.3),
        strokeColor: Colors.blue,
      ),
    );
  }

  Future<void> _drawDirections(LatLng origin, LatLng destination) async {
    List<LatLng>? result = await _googleMapPolyline.getCoordinatesWithLocation(
      origin: origin,
      destination: destination,
      mode: RouteMode.bicycling, // You can change the mode to your preference
    );

    if (result!.isNotEmpty) {
      _drawPolyline(result);
    }
  }

  void _drawPolyline(List<LatLng> coordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: coordinates,
      width: 5,
    );
    _polylines[id] = polyline;
  }

  Map<PolylineId, Polyline> _polylines = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
        ),

        body: Column(
          children: [
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
            ),
            Expanded(
              child: GoogleMap(
                initialCameraPosition: _kGooglePlex,
                markers: _markers,
                circles: _circles,
                polylines: Set<Polyline>.of(_polylines.values),
                mapType: MapType.normal,
                myLocationEnabled: true,
                compassEnabled: true,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                  _controller.complete(controller);
                },
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.black45)
                  ),
                  child: TextFormField(
                    controller: textEditingController,
                    decoration: const InputDecoration(
                      labelText: 'Enter your Location',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Location is required';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await _addMarkerFromAddress(textEditingController.text);
                }
              },
              child: Container(
                //color:Colors.green ,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),
               ),
                  child: const Text('Add Marker and Directions')),
            ),
          ],
        ),
      ),
    );
  }
}

// void main() => runApp(MaterialApp(home: GoogMapScreen()));
