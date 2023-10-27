import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_form.freezed.dart';

@freezed
class SignUpForm with _$SignUpForm {
  const SignUpForm._();

  factory SignUpForm({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) = _SignUpForm;

  String? get nameErrorText {
    if (name.isEmpty) {
      return 'Name is missing';
    }
    return null;
  }

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

  String? get confirmPasswordErrorText {
    if (confirmPassword.isEmpty) {
      return 'Confirm password is missing';
    }
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  bool get isValid =>
      name.isNotEmpty &&
      email.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      password == confirmPassword;
}
