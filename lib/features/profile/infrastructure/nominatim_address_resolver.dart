import 'package:dio/dio.dart';
import 'package:latlong2/latlong.dart';
import 'package:pizza_order_app/features/profile/domain/address_resolver.dart';

class NominatimAddressResolver extends AddressResolver {
  NominatimAddressResolver({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<LatLng> resolve({
    required String city,
    required String street,
    required String houseNumber,
  }) async {
    try {
      final response = await dio.getUri(_buildUrl(
        city: city,
        street: street,
        houseNumber: houseNumber,
      ));
      if (response.statusCode == 200) {
        if (response.data.length > 0) {
          return LatLng(
            double.parse(response.data[0]['lat']),
            double.parse(response.data[0]['lon']),
          );
        }
      }
      return const LatLng(0, 0);
    } catch (e) {
      return const LatLng(0, 0);
    }
  }

  Uri _buildUrl({
    required String city,
    required String street,
    required String houseNumber,
  }) {
    return Uri.parse(
      'https://nominatim.openstreetmap.org/search?format=json&counrty=Hungary&city=$city&street=$houseNumber $street',
    );
  }
}
