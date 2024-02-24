import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/forms/login_form.dart';

import 'package:campus_sync/auth/forms/safe_view.dart';
import 'package:campus_sync/auth/forms/sign_in_view.dart';
import 'package:campus_sync/auth/forms/sign_up_view.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/authority/login/authority_screen.dart';
import 'package:campus_sync/committee/login/committee_screen.dart';
import 'package:campus_sync/student/login/student_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    final authCubit = context.read<AuthCubit>();
    return SafeArea(
      child: Center(
        child: Scaffold(
          body: buildBlocConsumedAuthView(LoginForm(), authCubit),
        ),
      ),
    );
  }
}

Widget buildBlocConsumedAuthView(Widget authView, AuthCubit authCubit) {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      if (state is AuthUnauthenticatedState) {
        debugPrint('from first bloc - $state');
        return authView;
      } else {
        debugPrint('from first bloc - $state');

        return buildNonUnauthenticatedView(state, authCubit);
      }
    },
  );
}

Widget buildNonUnauthenticatedView(AuthState state, AuthCubit authCubit) {
  if (state is AuthUnauthenticatedState) {
    debugPrint('$state');
    return LoginForm();
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
