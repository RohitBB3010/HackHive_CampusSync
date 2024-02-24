import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/cubits/email_sign_up_cubit.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/auth/states/sign_up_state.dart' as form_state;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextString {
  static const String signUp = 'Sign Up';
  static const String backToLoginPage = 'Back to Login Page';
  static const String newHere = 'Seems like you are new here!!';
  static const String getIn = "Let's get you in";
  static const String setPass = 'Set Password';
  static const String confirmPass = 'Confirm Password';
  static const String passNotMatch = 'Passwords do not match';
}

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    if (screenWidth > 500) {
      return BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocBuilder<SignUpCubit, form_state.SignUpState>(
          builder: (context, state) {
            return LargeSignUpView(
              authCubit: authCubit,
              state: state,
              onSignUpButtonPressed: onSignUpButtonPressed,
              screenHeight: screenHeight,
              screenWidth: screenWidth,
            );
          },
        ),
      );
    } else {
      return BlocProvider(
        create: (context) => SignUpCubit(),
        child: BlocBuilder<SignUpCubit, form_state.SignUpState>(
          builder: (context, state) {
            return SmallSignUpView(
              authCubit: authCubit,
              state: state,
              onSignUpButtonPressed: onSignUpButtonPressed,
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            );
          },
        ),
      );
    }
  }
}

Future<void> onSignUpButtonPressed(
  BuildContext context,
  AuthCubit authCubit,
  form_state.SignUpState state,
) async {
  // context.loaderOverlay.show();
  await authCubit.signUp(
    email: (authCubit.state as EmailSignUpState).email,
    password: state.confirmPassword.value,
  );
  // context.loaderOverlay.hide();
}

class SmallSignUpView extends StatelessWidget {
  const SmallSignUpView(
      {super.key,
      required this.authCubit,
      required this.state,
      required this.onSignUpButtonPressed,
      required this.screenWidth,
      required this.screenHeight});

  final AuthCubit authCubit;
  final form_state.SignUpState state;
  final Future<void> Function(BuildContext, AuthCubit, form_state.SignUpState)
      onSignUpButtonPressed;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AutoSizeText(
              TextString.newHere,
              maxLines: 1,
              style: TextStyle(fontSize: 30, fontFamily: 'Euclid'),
            ),
            SizedBox(height: screenHeight * 0.02),
            SizedBox(
              width: screenWidth * 0.9,
              child: CustomTextField(
                enabled: false,
                initialValue: (authCubit.state as EmailSignUpState).email,
                icon: Icons.email,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            passwordTextField(screenWidth, context, authCubit),
            SizedBox(height: screenHeight * 0.03),
            confirmPasswordTextField(screenWidth, context, authCubit),
            SizedBox(height: screenHeight * 0.03),
            signUpButton(screenWidth, context, authCubit),
            SizedBox(height: screenHeight * 0.03),
            CustomTextButton(
              onPressed: context.read<AuthCubit>().returnToLoginPage,
              title: TextString.backToLoginPage,
            ),
          ],
        ),
      ),
    );
  }
}

class LargeSignUpView extends StatelessWidget {
  const LargeSignUpView(
      {super.key,
      required this.authCubit,
      required this.state,
      required this.onSignUpButtonPressed,
      required this.screenWidth,
      required this.screenHeight});

  final AuthCubit authCubit;
  final form_state.SignUpState state;
  final Future<void> Function(BuildContext, AuthCubit, form_state.SignUpState)
      onSignUpButtonPressed;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AutoSizeText(
              TextString.newHere,
              maxLines: 1,
              style: TextStyle(fontFamily: 'Euclid', fontSize: 30),
            ),
            const AutoSizeText(
              TextString.getIn,
              maxLines: 1,
              style: TextStyle(fontFamily: 'Euclid', fontSize: 30),
            ),
            SizedBox(height: screenHeight * 0.04),
            SizedBox(
              width: screenWidth * 0.9,
              child: CustomTextField(
                initialValue: (authCubit.state as EmailSignUpState).email,
                enabled: false,
                icon: Icons.email,
              ),
            ),
            SizedBox(height: screenHeight * 0.035),
            passwordTextField(screenWidth, context, authCubit),
            SizedBox(height: screenHeight * 0.035),
            confirmPasswordTextField(screenWidth, context, authCubit),
            SizedBox(height: screenHeight * 0.035),
            signUpButton(screenWidth, context, authCubit),
            SizedBox(height: screenHeight * 0.04),
            CustomTextButton(
              onPressed: authCubit.returnToLoginPage,
              title: TextString.backToLoginPage,
            ),
          ],
        ),
      ),
    );
  }
}

Widget passwordTextField(
    double screenWidth, BuildContext context, AuthCubit authCubit) {
  return SizedBox(
    width: screenWidth * 0.9,
    child: Builder(
      builder: (context) {
        return CustomTextField(
            obscureText:
                (authCubit.state as EmailSignUpState).isPasswordVisible,
            onChanged: context.read<SignUpCubit>().passwordChanged,
            validator: (_) => context.read<SignUpCubit>().state.password.error,
            labelText: TextString.setPass,
            icon: Icons.lock,
            suffixIcon: (authCubit.state as EmailSignUpState).isPasswordVisible
                ? Icons.visibility
                : Icons.visibility_off,
            onSuffixIconPressed: () {
              authCubit.togglePasswordVisibilitySignUpPassword();
            });
      },
    ),
  );
}

Widget signUpButton(
    double screenWidth, BuildContext context, AuthCubit authCubit) {
  return SizedBox(
    width: screenWidth * 0.9,
    child: CustomElevatedButton(
        title: TextString.signUp,
        //color: Colors.deepPurple,
        onPressed: () async {
          await onSignUpButtonPressed(
            context,
            authCubit,
            context.read<SignUpCubit>().state,
          );
        }),
  );
}

Widget confirmPasswordTextField(
    double screenWidth, BuildContext context, AuthCubit authCubit) {
  return SizedBox(
    width: screenWidth * 0.9,
    child: CustomTextField(
      obscureText:
          (authCubit.state as EmailSignUpState).isConfirmPasswordVisible,
      onChanged: context.read<SignUpCubit>().confirmPasswordChanged,
      validator: (value) {
        if (context.read<SignUpCubit>().state.password.value !=
            context.read<SignUpCubit>().state.confirmPassword.value) {
          return TextString.passNotMatch;
        }
        return null;
      },
      labelText: TextString.confirmPass,
      icon: Icons.lock,
      suffixIcon: (authCubit.state as EmailSignUpState).isConfirmPasswordVisible
          ? Icons.visibility
          : Icons.visibility_off,
      onSuffixIconPressed:
          authCubit.togglePasswordVisibilitySignUpConfirmPassword,
    ),
  );
}
