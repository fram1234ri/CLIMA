import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  static final LatLng quito = LatLng(-0.1807, -78.4678);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa - Quito'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: quito,
          zoom: 13.0,
          interactiveFlags: InteractiveFlag.all,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.flutter_clima_quito',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: quito,
                width: 80,
                height: 80,
                builder: (ctx) => Icon(
                  Icons.location_on,
                  size: 48,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
