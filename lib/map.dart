import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class HomeMap extends StatefulWidget {
  HomeMap({Key? key}) : super(key: key);

  @override
  _HomeMapState createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  Completer<GoogleMapController> _controller = Completer();
  List<Marker>market=[];
  @override
  void initState(){
  marcadores();
  super.initState();
  }
  void marcadores(){
  Marker labelone=Marker(
  markerId: MarkerId('labelone'),
  position:LatLng( 13.726235, -89.367166 ),
  infoWindow: InfoWindow(title: 'Encomiendas SV Lourdes'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueOrange
  ),
  );
  Marker labeltwo=Marker(
  markerId: MarkerId('labeltwo'),
  position:LatLng( 13.677881, -89.267931 ),
  infoWindow: InfoWindow(title: 'Encomiendas SV Merliot'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueGreen
  ),
  );
  Marker labelthree=Marker(
  markerId: MarkerId('labelthree'),
  position:LatLng( 13.677538, -89.284816 ),
  infoWindow: InfoWindow(title: 'Encomiendas SV Santa Tecla'),
    
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueRed
  ),
  );
  Marker labelfour=Marker(
  markerId: MarkerId('labelfour'),
  position:LatLng( 13.6412539, -88.8032335 ),
  infoWindow: InfoWindow(title: 'Encomiendas SV San Vicente'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueCyan
  ),
  );
  setState(() {
    market.add(labelone);
    market.add(labeltwo);
    market.add(labelthree);
    market.add(labelfour);
});
  }
    static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.69, -89.19),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        markers: market.map((e) => e).toSet(),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      );
  }
}