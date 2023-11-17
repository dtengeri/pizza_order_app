// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeliveryAddress _$DeliveryAddressFromJson(Map<String, dynamic> json) {
  return _DeliveryAddress.fromJson(json);
}

/// @nodoc
mixin _$DeliveryAddress {
  String get city => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get houseNumber => throw _privateConstructorUsedError;
  LatLng get coordinates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeliveryAddressCopyWith<DeliveryAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryAddressCopyWith<$Res> {
  factory $DeliveryAddressCopyWith(
          DeliveryAddress value, $Res Function(DeliveryAddress) then) =
      _$DeliveryAddressCopyWithImpl<$Res, DeliveryAddress>;
  @useResult
  $Res call(
      {String city, String street, String houseNumber, LatLng coordinates});
}

/// @nodoc
class _$DeliveryAddressCopyWithImpl<$Res, $Val extends DeliveryAddress>
    implements $DeliveryAddressCopyWith<$Res> {
  _$DeliveryAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? street = null,
    Object? houseNumber = null,
    Object? coordinates = null,
  }) {
    return _then(_value.copyWith(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      houseNumber: null == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryAddressImplCopyWith<$Res>
    implements $DeliveryAddressCopyWith<$Res> {
  factory _$$DeliveryAddressImplCopyWith(_$DeliveryAddressImpl value,
          $Res Function(_$DeliveryAddressImpl) then) =
      __$$DeliveryAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String city, String street, String houseNumber, LatLng coordinates});
}

/// @nodoc
class __$$DeliveryAddressImplCopyWithImpl<$Res>
    extends _$DeliveryAddressCopyWithImpl<$Res, _$DeliveryAddressImpl>
    implements _$$DeliveryAddressImplCopyWith<$Res> {
  __$$DeliveryAddressImplCopyWithImpl(
      _$DeliveryAddressImpl _value, $Res Function(_$DeliveryAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = null,
    Object? street = null,
    Object? houseNumber = null,
    Object? coordinates = null,
  }) {
    return _then(_$DeliveryAddressImpl(
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      houseNumber: null == houseNumber
          ? _value.houseNumber
          : houseNumber // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _value.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryAddressImpl implements _DeliveryAddress {
  const _$DeliveryAddressImpl(
      {required this.city,
      required this.street,
      required this.houseNumber,
      this.coordinates = const LatLng(0, 0)});

  factory _$DeliveryAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryAddressImplFromJson(json);

  @override
  final String city;
  @override
  final String street;
  @override
  final String houseNumber;
  @override
  @JsonKey()
  final LatLng coordinates;

  @override
  String toString() {
    return 'DeliveryAddress(city: $city, street: $street, houseNumber: $houseNumber, coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryAddressImpl &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.houseNumber, houseNumber) ||
                other.houseNumber == houseNumber) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, city, street, houseNumber, coordinates);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryAddressImplCopyWith<_$DeliveryAddressImpl> get copyWith =>
      __$$DeliveryAddressImplCopyWithImpl<_$DeliveryAddressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryAddressImplToJson(
      this,
    );
  }
}

abstract class _DeliveryAddress implements DeliveryAddress {
  const factory _DeliveryAddress(
      {required final String city,
      required final String street,
      required final String houseNumber,
      final LatLng coordinates}) = _$DeliveryAddressImpl;

  factory _DeliveryAddress.fromJson(Map<String, dynamic> json) =
      _$DeliveryAddressImpl.fromJson;

  @override
  String get city;
  @override
  String get street;
  @override
  String get houseNumber;
  @override
  LatLng get coordinates;
  @override
  @JsonKey(ignore: true)
  _$$DeliveryAddressImplCopyWith<_$DeliveryAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
