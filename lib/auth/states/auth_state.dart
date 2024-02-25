import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthAuthenticatedState extends AuthState {}

abstract class EmailState extends AuthState {}

abstract class SignInStateAuth extends AuthState {}

class EmailPasswordResetLinkSent extends EmailSignInState {
  EmailPasswordResetLinkSent(
      super.email, super.isPasswordVisible, super.userType);
}

//Class for when user has already signed in
class EmailSignInState extends EmailState {
  EmailSignInState(this.email, this.isPasswordVisible, this.userType);
  final String email;
  final bool isPasswordVisible;
  final String userType;
}

class EmailSignInErrorState extends EmailSignInState {
  EmailSignInErrorState(
      super.email, super.isPasswordVisible, this.message, super.userType);

  final String message;
}

//Class for when user needs to sign up
class EmailSignUpState extends EmailState {
  EmailSignUpState(
    this.email,
    this.isPasswordVisible,
    this.isConfirmPasswordVisible,
    this.isEmailVerified,
  );
  final String email;
  final bool isPasswordVisible;
  final bool isConfirmPasswordVisible;
  final bool isEmailVerified;
}

class AuthUnauthenticatedState extends AuthState {
  AuthUnauthenticatedState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.phone = const Phone.pure(),
      this.otp = const OTP.pure(),
      this.field = const Field.pure(),
      this.isButtonEnabled = false,
      this.userType = const userTypeFormz.pure()});

  final Email email;
  final Password password;
  final Phone phone;
  final OTP otp;
  final Field field;
  final bool isButtonEnabled;
  final userTypeFormz userType;

  AuthUnauthenticatedState copyWith({
    Email? email,
    Password? password,
    Phone? phone,
    OTP? otp,
    Field? field,
    userTypeFormz? userType,
  }) {
    return AuthUnauthenticatedState(
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        otp: otp ?? this.otp,
        field: field ?? this.field,
        userType: userType ?? this.userType);
  }
}

class AuthLoadingState extends AuthState {}

class StudentSignInState extends AuthState {}

class AuthoritySignInState extends AuthState {}

class CommitteeSignInState extends AuthState {}

class EmailSignState extends SignInStateAuth {
  EmailSignState(this.value);
  final String value;
}

class AuthError extends AuthState {
  AuthError(this.message);
  final String message;
}
