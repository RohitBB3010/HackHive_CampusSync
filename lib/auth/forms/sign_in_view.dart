import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/cubits/email_sign_in_cubit.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/auth/states/sign_in_state.dart';
import 'package:campus_sync/auth/states/sign_in_state.dart' as form_state;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    final authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = authCubit.state;
      if (authState is EmailVerificationLinkSent) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Kindly check email for verification link'),
          ),
        );
      }
      if (authState is UnverifiedEmailAuthState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Email Unverified'),
            action: SnackBarAction(
              label: 'Resend Verification Link',
              onPressed: () {
                try {
                  FirebaseAuth.instance.currentUser?.sendEmailVerification();
                } catch (e) {
                  debugPrint('$e');
                }
              },
            ),
          ),
        );
      }
      if (authState is EmailPasswordResetLinkSent) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password Reset Link Sent to Email'),
          ),
        );
      }
    });

    if (screenWidth > 500) {
      return BlocProvider(
        create: (context) => SignInCubit(),
        child: BlocBuilder<SignInCubit, form_state.SignInState>(
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const AutoSizeText(
                      "Let's get you in",
                      maxLines: 1,
                      style: TextStyle(fontFamily: 'Euclid', fontSize: 50),
                    ),
                    heightBetweenFields_1(context),
                    emailField(authCubit, screenWidth),
                    heightBetweenFields_1(context),
                    passwordField(context, screenWidth, authCubit),
                    if (authCubit.state is EmailSignInErrorState)
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          (authCubit.state as EmailSignInErrorState).message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomTextButton(
                            title: 'Reset Password',
                            onPressed: () {
                              context.read<AuthCubit>().passwordReset(
                                    (authCubit.state as EmailSignInState).email,
                                  );
                            }),
                        widthBetweenFields_1(context),
                      ],
                    ),
                    heightBetweenFields_1(context),
                    signInButton(authCubit, state),
                    heightBetweenFields_1(context),
                    CustomTextButton(
                      onPressed: authCubit.returnToLoginPage,
                      title: 'Back to Login Page',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return BlocProvider(
        create: (context) => SignInCubit(),
        child: BlocBuilder<SignInCubit, form_state.SignInState>(
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AutoSizeText(
                      "Let's get you in",
                      style: TextStyle(fontSize: 30, fontFamily: 'Euclid'),
                      maxLines: 1,
                    ),
                    heightBetweenFields_1(context),
                    emailField(authCubit, screenWidth),
                    heightBetweenFields_1(context),
                    passwordField(context, screenWidth, authCubit),
                    if (authCubit.state is EmailSignInErrorState)
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Text(
                          (authCubit.state as EmailSignInErrorState).message,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        CustomTextButton(
                          title: 'Reset Password',
                          onPressed: () {
                            context.read<AuthCubit>().passwordReset(
                                  (authCubit.state as EmailSignInState).email,
                                );
                          },
                        ),
                        widthBetweenFields_1(context),
                      ],
                    ),
                    heightBetweenFields_1(context),
                    signInButton(authCubit, state),
                    heightBetweenFields_1(context),
                    CustomTextButton(
                      onPressed: context.read<AuthCubit>().returnToLoginPage,
                      title: 'Back to login page',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}

Widget signInButton(AuthCubit authCubit, SignInState state) {
  return CustomElevatedButton(
      title: 'Sign In',
      //color: Colors.deepPurple,
      onPressed: () {
        authCubit.signIn(
          email: (authCubit.state as EmailSignInState).email,
          password: state.password.value,
        );
      });
}

Widget passwordField(
    BuildContext context, double screenWidth, AuthCubit authCubit) {
  return SizedBox(
    width: screenWidth * 0.9,
    child: CustomTextField(
        obscureText: (authCubit.state as EmailSignInState).isPasswordVisible,
        validator: (_) => context.read<SignInCubit>().state.password.error,
        onChanged: context.read<SignInCubit>().passwordChanged,
        labelText: 'Enter your Password',
        icon: Icons.lock,
        suffixIcon: (authCubit.state as EmailSignInState).isPasswordVisible
            ? Icons.visibility
            : Icons.visibility_off,
        onSuffixIconPressed: () {
          authCubit.togglePasswordVisibilitySignIn();
        }),
  );
}

Widget emailField(AuthCubit authCubit, double screenWidth) {
  return SizedBox(
    width: screenWidth * 0.9,
    child: CustomTextField(
      enabled: false,
      initialValue: (authCubit.state as EmailSignInState).email,
      icon: Icons.email,
    ),
  );
}
