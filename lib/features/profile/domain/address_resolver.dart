import 'package:latlong2/latlong.dart';

abstract class AddressResolver {
  Future<LatLng> resolve({
    required String city,
    required String street,
    required String houseNumber,
  });
}
