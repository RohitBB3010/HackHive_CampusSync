import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/forms/login_form.dart';

import 'package:campus_sync/auth/forms/safe_view.dart';
import 'package:campus_sync/auth/forms/sign_in_view.dart';
import 'package:campus_sync/auth/forms/sign_up_view.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.userType});
  final String userType;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = authCubit.state;
    });

    return SafeArea(
      child: Center(
        child: Scaffold(
          body: buildBlocConsumedAuthView(const LoginForm()),
        ),
      ),
    );
  }
}

// Widget buildBlocConsumedAuthView(Widget authView) {
//   return BlocConsumer<AuthCubit, AuthState>(
//     listenWhen: (previous, current) => current is PhoneAuthActionState,
//     buildWhen: (previous, current) => current is! PhoneAuthActionState,
//     listener: (context, state) {
//       if (state is OTPRequestedState) {
//         context.read<AuthCubit>().signInWithPhone(state.phoneNumber);
//       }
//     },
//     builder: (context, state) {
//       if (state is AuthUnauthenticatedState) {
//         debugPrint('from first bloc - $state');
//         return authView;
//       } else {
//         debugPrint('from first bloc - $state');

//         return buildNonUnauthenticatedView(state);
//       }
//     },
//   );
// }

Widget buildBlocConsumedAuthView(Widget authView) {
  return BlocBuilder<AuthCubit, AuthState>(
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
