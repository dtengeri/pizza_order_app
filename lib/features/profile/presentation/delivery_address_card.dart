import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:pizza_order_app/features/profile/domain/delivery_address.dart';

class DeliveryAddressCard extends StatelessWidget {
  const DeliveryAddressCard({
    super.key,
    required this.address,
  });

  final DeliveryAddress address;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text(address.city),
            subtitle: Text('${address.street} ${address.houseNumber}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: IgnorePointer(
              child: FlutterMap(
                mapController: MapController(),
                options: MapOptions(
                  initialCenter: address.coordinates,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.dtengeri.szte.pizza_order_app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: address.coordinates,
                        child: const Icon(Icons.location_on),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
