import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/login.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:campus_sync/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key, required this.userType});
  final String userType;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..checkAuth(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthAuthenticatedState) {
            return HomeScreen();
          } else if (state is AuthLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
