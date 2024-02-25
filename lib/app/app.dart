import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/login.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/authority/authority_bottom_nav.dart';
import 'package:campus_sync/authority/home_pages.dart/pages/authority_profile.dart';
import 'package:campus_sync/authority/home_pages.dart/pages/authority_screen.dart';
import 'package:campus_sync/committee/login/committee_screen.dart';
import 'package:campus_sync/components/text_button.dart';
import 'package:campus_sync/consts/colors.dart';
import 'package:campus_sync/student/login/student_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  App({super.key});

  var authorityPageRoutes = {
    '/profile': (context) => const AuthorityProfile(),
    //'proposalList' : (context) => const
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: authorityPageRoutes,
      theme: ThemeData(
        scaffoldBackgroundColor: primary_2,
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
            final authCubit = context.read<AuthCubit>();
            if (state is AuthAuthenticatedState) {
              if (authCubit.usersType == 'Student') {
                debugPrint('code from app.dart ran');
                return StudentScreen();
              } else if (authCubit.usersType == 'Authority') {
                return const AuthorityScreen();
              } else if (authCubit.usersType == 'Committee') {
                return CommitteeScreen();
                //return AutoSizeText('Rohit');
              } else
                return Column(
                  children: [
                    const Text('home'),
                    CustomTextButton(
                        title: 'signout',
                        onPressed: context.read<AuthCubit>().returnToLoginPage)
                  ],
                );
            } else if (state is StudentSignInState) {
              debugPrint('code from app.dart ran');
              return StudentScreen();
            } else if (state is AuthoritySignInState) {
              return AuthorityScreen();
            } else if (state is CommitteeSignInState) {
              return CommitteeScreen();
              //return AutoSizeText('Rohit');
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
