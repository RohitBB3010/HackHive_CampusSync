import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthAuthenticatedState extends AuthState {}

abstract class PhoneAuthState extends AuthState {
  PhoneAuthState(
    this.phoneNumber,
  );

  final String phoneNumber;
}

abstract class PhoneAuthActionState extends PhoneAuthState {
  PhoneAuthActionState(
    this.phoneNumber,
  ) : super(phoneNumber);

  @override
  final String phoneNumber;
}

abstract class GoogleAuthState extends AuthState {}

abstract class EmailState extends AuthState {}

abstract class SignInStateAuth extends AuthState {}

class UnverifiedEmailAuthState extends EmailSignInState {
  UnverifiedEmailAuthState(super.email, super.isPasswordVisible);
}

class EmailVerificationLinkSent extends EmailSignInState {
  EmailVerificationLinkSent(super.email, super.isPasswordVisible);
}

class EmailPasswordResetLinkSent extends EmailSignInState {
  EmailPasswordResetLinkSent(super.email, super.isPasswordVisible);
}

// class EmailVerificationLinkSent extends EmailState{
//   EmailVerificationLinkSent(this.email, this.isPasswordVisible);
//
//   final String email;
//   final bool isPasswordVisible;
// }
//
// class UnverifiedEmailAuthState extends EmailState{
//   UnverifiedEmailAuthState(this.email, this.isPasswordVisible);
//
//   final String email;
//   final bool isPasswordVisible;
// }

//Class for when user has already signed in
class EmailSignInState extends EmailState {
  EmailSignInState(this.email, this.isPasswordVisible);
  final String email;
  final bool isPasswordVisible;
}

class EmailSignInErrorState extends EmailSignInState {
  EmailSignInErrorState(super.email, super.isPasswordVisible, this.message);

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
  AuthUnauthenticatedState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.phone = const Phone.pure(),
    this.otp = const OTP.pure(),
    this.field = const Field.pure(),
    this.isButtonEnabled = false,
  });

  final Email email;
  final Password password;
  final Phone phone;
  final OTP otp;
  final Field field;
  final bool isButtonEnabled;

  AuthUnauthenticatedState copyWith({
    Email? email,
    Password? password,
    Phone? phone,
    OTP? otp,
    Field? field,
  }) {
    return AuthUnauthenticatedState(
      email: email ?? this.email,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      field: field ?? this.field,
    );
  }
}

class AuthLoadingState extends AuthState {}

class OTPRequestedState extends PhoneAuthActionState {
  OTPRequestedState(super.phoneNumber);
}

class EmailSignState extends SignInStateAuth {
  EmailSignState(this.value);
  final String value;
}

class GoogleAuthInitialState extends AuthState {}

class AuthError extends AuthState {
  AuthError(this.message);
  final String message;
}

class PhoneVerificationSent extends PhoneAuthState {
  PhoneVerificationSent(
    this.verificationId,
    this.resendToken,
    String phoneNumber,
  ) : super(phoneNumber);

  final String verificationId;
  final int resendToken;
}

class PhoneAutoRetrievalTimeout extends PhoneAuthState {
  PhoneAutoRetrievalTimeout(this.verificationId, String phoneNumber)
      : super(phoneNumber);
  final String verificationId;
}

class OTPSentForWeb extends PhoneAuthState {
  OTPSentForWeb(this.confirmationResult, String phoneNumber)
      : super(phoneNumber);
  final ConfirmationResult confirmationResult;
}

//class OTPMismatchState extends PhoneAuthState {}
