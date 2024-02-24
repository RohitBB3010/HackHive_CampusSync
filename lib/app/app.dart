import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/login.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: primary_3,
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 3, 128, 232)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(
            const Color(0xFF13B9FF),
          ),
          thumbVisibility: MaterialStateProperty.all<bool>(true),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AuthCubit()..checkAuth(),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthAuthenticatedState) {
              return const Text('home');
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
      ),
    );
  }
}