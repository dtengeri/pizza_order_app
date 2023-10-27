import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form.freezed.dart';

@freezed
class LoginForm with _$LoginForm {
  const LoginForm._();
  const factory LoginForm({
    required String email,
    required String password,
  }) = _LoginForm;

  String? get emailErrorText {
    if (email.isEmpty) {
      return 'Email is missing';
    }
    return null;
  }

  String? get passwordErrorText {
    if (password.isEmpty) {
      return 'Password is missing';
    }
    return null;
  }

  bool get isValid => email.isNotEmpty && password.isNotEmpty;
}
