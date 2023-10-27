import 'package:freezed_annotation/freezed_annotation.dart';

part 'pizza.freezed.dart';

@freezed
class Pizza with _$Pizza {
  const factory Pizza({
    required String name,
    required double price,
  }) = _Pizza;
}
