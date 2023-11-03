import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_address.freezed.dart';

@freezed
class DeliveryAddress with _$DeliveryAddress {
  const factory DeliveryAddress({
    required String city,
    required String street,
    required String houseNumber,
  }) = _DeliveryAddress;
}
