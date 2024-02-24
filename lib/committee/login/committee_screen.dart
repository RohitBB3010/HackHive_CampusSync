import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/login.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/committee/login/committee_mandatory_fields.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/student/login/cubits/check_cubit.dart';
import 'package:campus_sync/student/login/student_mandatory_fields.dart';
import 'package:campus_sync/student/login/states/check_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CommitteeScreen extends StatelessWidget {
  CommitteeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   return StreamBuilder(
    //     stream: AuthService().userStream,
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: Text('Loading'),
    //         );
    //       } else if (snapshot.hasError) {
    //         return const Center(
    //           child: Text('Error'),
    //         );
    //       } else if (snapshot.hasData) {
    //         return const TopicsScreen();
    //       } else {
    //         return const LoginScreen();
    //       }
    //     },
    //   );
    // }

    return BlocProvider(
      create: (context) => AuthCubit()..checkAuth(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (authState is UnverifiedEmailAuthState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Email Unverified'),
                  action: SnackBarAction(
                    label: 'Resend Verification Link',
                    onPressed: () {
                      try {
                        FirebaseAuth.instance.currentUser
                            ?.sendEmailVerification();
                      } catch (e) {
                        debugPrint('$e');
                      }
                    },
                  ),
                ),
              );
            }
          });
          if (authState is AuthAuthenticatedState) {
            debugPrint('$authState');
            return const DisplayScreen();
          } else if (authState is AuthLoadingState) {
            debugPrint('$authState');
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            debugPrint('$authState');
            return const LoginScreen();
          }
        },
      ),
    );
  }
}

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CheckCubit()..checkUserDataStatus(context.read<AuthCubit>().uid),
      child: BlocBuilder<CheckCubit, CheckState>(
        builder: (context, state) {
          if (state is DataUnavailableState) {
            return CommitteeMandatoryFields();
          } else if (state is CheckLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return BlocProvider(
              create: (context) => AuthCubit(),
              child: Scaffold(
                  // body: const TopicsScreen(),
                  body: Column(
                children: [
                  const Text(' Authority home'),
                  CustomElevatedButton(
                      title: 'Signout',
                      onPressed: context.read<AuthCubit>().returnToLoginPage)
                ],
              )),
            );
          }
        },
      ),
    );
  }
}
