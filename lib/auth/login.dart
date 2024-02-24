import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/forms/login_form.dart';
import 'package:campus_sync/auth/forms/phone_view.dart';
import 'package:campus_sync/auth/forms/safe_view.dart';
import 'package:campus_sync/auth/forms/sign_in_view.dart';
import 'package:campus_sync/auth/forms/sign_up_view.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = authCubit.state;

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
    });

    // return OrientationBuilder(builder: (context, orientation) {
    //   bool isLandscape = (MediaQuery.of(context).size.width < 1024 &&
    //       MediaQuery.of(context).size.height <= 800 &&
    //       orientation == Orientation.landscape &&
    //       View.of(context).viewInsets.bottom <= 0.0);
    //   return LandscapeNotSupported(
    //       child: Scaffold(body: buildBlocConsumedAuthView(const LoginForm())),
    //       isLandscape: isLandscape);
    // });
    return SafeArea(
      // child: Scaffold(
      //     body: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       // Container(
      //       //   margin: const EdgeInsets.only(top: 20),
      //       //   height: screenHeight * 0.08,
      //       //   width: screenWidth * 0.6,
      //       //   child: Image.asset("rankUP_banner.png"),
      //       // ),
      //       //heightBetweenFields(screenHeight),

      //       buildBlocConsumedAuthView(const LoginForm()),
      //     ],
      //   ),
      // )),
      child: Center(
        child: Scaffold(
          body: buildBlocConsumedAuthView(const LoginForm()),
        ),
      ),
    );
  }
}

Widget buildBlocConsumedAuthView(Widget authView) {
  return BlocConsumer<AuthCubit, AuthState>(
    listenWhen: (previous, current) => current is PhoneAuthActionState,
    buildWhen: (previous, current) => current is! PhoneAuthActionState,
    listener: (context, state) {
      if (state is OTPRequestedState) {
        context.read<AuthCubit>().signInWithPhone(state.phoneNumber);
      }
    },
    builder: (context, state) {
      if (state is AuthUnauthenticatedState) {
        debugPrint('from first bloc - $state');
        return authView;
      } else {
        debugPrint('from first bloc - $state');

        return buildNonUnauthenticatedView(state);
      }
    },
  );
}

Widget buildNonUnauthenticatedView(AuthState state) {
  if (state is AuthUnauthenticatedState) {
    debugPrint('$state');
    return const LoginForm();
  } else if (state is PhoneAuthState) {
    debugPrint('$state');
    return const PhoneView();
  } else if (state is EmailSignInState) {
    debugPrint('$state');
    return const SignInForm();
  } else if (state is EmailSignUpState) {
    debugPrint('$state');

    return SignUpForm();
  } else {
    debugPrint('$state');
    return const SafeView();
  }
}
