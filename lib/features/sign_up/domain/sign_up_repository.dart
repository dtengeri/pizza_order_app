import 'package:pizza_order_app/features/core/domain/user.dart';
import 'package:pizza_order_app/features/sign_up/domain/sign_up_form.dart';

abstract class SignUpRepository {
  Future<User> signUp({required SignUpForm signUpForm});
}
