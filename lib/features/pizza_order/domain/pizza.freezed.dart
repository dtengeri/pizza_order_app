// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pizza.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Pizza {
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PizzaCopyWith<Pizza> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PizzaCopyWith<$Res> {
  factory $PizzaCopyWith(Pizza value, $Res Function(Pizza) then) =
      _$PizzaCopyWithImpl<$Res, Pizza>;
  @useResult
  $Res call({String name, double price});
}

/// @nodoc
class _$PizzaCopyWithImpl<$Res, $Val extends Pizza>
    implements $PizzaCopyWith<$Res> {
  _$PizzaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PizzaImplCopyWith<$Res> implements $PizzaCopyWith<$Res> {
  factory _$$PizzaImplCopyWith(
          _$PizzaImpl value, $Res Function(_$PizzaImpl) then) =
      __$$PizzaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double price});
}

/// @nodoc
class __$$PizzaImplCopyWithImpl<$Res>
    extends _$PizzaCopyWithImpl<$Res, _$PizzaImpl>
    implements _$$PizzaImplCopyWith<$Res> {
  __$$PizzaImplCopyWithImpl(
      _$PizzaImpl _value, $Res Function(_$PizzaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$PizzaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PizzaImpl implements _Pizza {
  const _$PizzaImpl({required this.name, required this.price});

  @override
  final String name;
  @override
  final double price;

  @override
  String toString() {
    return 'Pizza(name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PizzaImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PizzaImplCopyWith<_$PizzaImpl> get copyWith =>
      __$$PizzaImplCopyWithImpl<_$PizzaImpl>(this, _$identity);
}

abstract class _Pizza implements Pizza {
  const factory _Pizza(
      {required final String name, required final double price}) = _$PizzaImpl;

  @override
  String get name;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$PizzaImplCopyWith<_$PizzaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
