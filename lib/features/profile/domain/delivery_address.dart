import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:latlong2/latlong.dart';

part 'delivery_address.freezed.dart';
part 'delivery_address.g.dart';

@freezed
class DeliveryAddress with _$DeliveryAddress {
  const factory DeliveryAddress({
    required String city,
    required String street,
    required String houseNumber,
    @Default(LatLng(0, 0)) LatLng coordinates,
  }) = _DeliveryAddress;

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) =>
      _$DeliveryAddressFromJson(json);
}
