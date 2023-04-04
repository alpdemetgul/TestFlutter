import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GeoLocation extends StatefulWidget {
  const GeoLocation({super.key});

  @override
  State<GeoLocation> createState() => _GeoLocationState();
}

class _GeoLocationState extends State<GeoLocation> {
  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool _isLoading = true;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  void checkService() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }

  void checkPermission() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  void getLocation() async {
    _locationData = await location.getLocation();
    setState(() {
      _isLoading = false;
    });
  }

  CameraPosition initialCameraPosition() {
    print(_locationData);
    return CameraPosition(
      target: LatLng(_locationData.latitude!, _locationData.longitude!),
      zoom: 14.4746,
    );
  }

  @override
  void initState() {
    checkService();
    checkPermission();
    getLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: _isLoading
            ? const CircularProgressIndicator()
            : GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: initialCameraPosition(),
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                markers: {
                    Marker(
                      markerId: const MarkerId('Current Position'),
                      position: LatLng(
                          _locationData.latitude!, _locationData.longitude!),
                    ),
                  }),
      ),
    ));
  }
}
