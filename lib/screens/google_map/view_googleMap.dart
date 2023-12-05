import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatelessWidget {
  double lt;
  double lg;
  GoogleMapScreen({super.key, required this.lt, required this.lg});
  Set<Marker> firstMarker = {};

  @override
  Widget build(BuildContext context) {

    LatLng markerPosition = LatLng(lt, lg);
    firstMarker.add(
      Marker(
        // draggable: true,
        position: markerPosition,
        markerId: MarkerId("1"),
      ),
    );

    CameraPosition _kGooglePlex = CameraPosition(
      target: markerPosition,
      zoom: 17.4746,
    );

    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
            markers: firstMarker,
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {}
        ),
      ),
    );
  }
}