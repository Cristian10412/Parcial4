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
  Marker etiquetauno=Marker(
  markerId: MarkerId('etiqueta1'),
  position:LatLng( 13.98963227246124, -89.67701764016482 ),
  infoWindow: InfoWindow(title: 'Domicilios SV chalchuapa'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueBlue
  ),
  );
  Marker etiquetados=Marker(
  markerId: MarkerId('etiqueta2'),
  position:LatLng( 13.905209430364646, -89.49985877826892 ),
  infoWindow: InfoWindow(title: 'Domicilios SV Congo'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
  BitmapDescriptor.hueBlue
  ),
  );
  setState(() {
    market.add(etiquetauno);
    market.add(etiquetados);
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