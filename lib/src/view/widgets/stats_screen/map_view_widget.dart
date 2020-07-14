import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewWidget extends StatefulWidget {
  @override
  State<MapViewWidget> createState() => MapViewWidgetState();
}

class MapViewWidgetState extends State<MapViewWidget> {
  Completer<GoogleMapController> _controller = Completer();

  Set<Marker> mrks = {
    Marker(
      markerId: MarkerId('100'),
      visible: true,
      infoWindow: InfoWindow(title: 'Total Cases', snippet: '10,553,120'),
      position: LatLng(20,25),
    ),
    Marker(
      markerId: MarkerId('101'),
      visible: true,
      infoWindow: InfoWindow(title: 'Total Cases', snippet: '10,003,120'),
      position: LatLng(48.1253869,4.1287004),
    ),
    Marker(
      markerId: MarkerId('102'),
      visible: true,
      infoWindow: InfoWindow(title: 'Total Cases', snippet: '153,120'),
      position: LatLng(50.0,-110.0),
    ),
    Marker(
      markerId: MarkerId('103'),
      visible: true,
      infoWindow: InfoWindow(title: 'Total Cases', snippet: '100,200'),
      position: LatLng(-15,-65),
    ),
    Marker(
      markerId: MarkerId('104'),
      visible: true,
      infoWindow: InfoWindow(title: 'Total Cases', snippet: '100,557'),
      position: LatLng(-21,130),
    ),
    Marker(
      markerId: MarkerId('105'),
      visible: true,
      infoWindow: InfoWindow(title: 'Total Cases', snippet: '2,553,120'),
      position: LatLng(50,90),
    ),
  };
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(0, 0),
    zoom: -10,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        width: size.width * 0.90,
        height: size.height * 0.35,
        child: GoogleMap(
          zoomControlsEnabled: false,
          zoomGesturesEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: mrks,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}
