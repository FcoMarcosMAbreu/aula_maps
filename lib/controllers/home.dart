import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GoogleMapController? mapController;
  final LatLng _center = const LatLng(-5.088924, -42.810758);
  Set<Marker> markers = {};
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      markers.add(const Marker(
        markerId: MarkerId('central'),
        position: LatLng(-5.0888385, -42.8493706),
        infoWindow: InfoWindow(title: 'Central'),
      ));
      markers.add(const Marker(
        markerId: MarkerId('reitoria'),
        position: LatLng(-5.076017, -42.751630),
        infoWindow: InfoWindow(title: 'Reitoria'),
      ));
      markers.add(const Marker(
        markerId: MarkerId('sul'),
        position: LatLng(-5.082412, -42.8589314),
        infoWindow: InfoWindow(title: 'Sul'),
      ));
      markers.add(const Marker(
        markerId: MarkerId('dirceu'),
        position: LatLng(-5.099445, -42.738870),
        infoWindow: InfoWindow(title: 'Dirceu'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unidades do IFPI'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 11.0),
        markers: markers,
      ),
    );
  }
}
