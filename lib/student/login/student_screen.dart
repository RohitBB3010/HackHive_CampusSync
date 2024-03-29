import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/login.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/student/login/cubits/check_student_cubit.dart';
import 'package:campus_sync/student/login/student_mandatory_fields.dart';
import 'package:campus_sync/student/login/states/check_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class StudentScreen extends StatelessWidget {
  StudentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..checkAuth(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
          if (authState is StudentSignInState) {
            debugPrint('code from student screen - $authState');
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
      create: (context) => CheckStudentCubit()
        ..checkUserDataStatus(context.read<AuthCubit>().uid),
      child: BlocBuilder<CheckStudentCubit, CheckStudentState>(
        builder: (context, state) {
          if (state is StudentDataUnavailableState) {
            return StudentMandatoryFields();
          } else if (state is StudentCheckLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return BlocProvider(
              create: (context) => AuthCubit(),
              child: Scaffold(
                  // body: const TopicsScreen(),
                  body: Column(
                children: [
                  const Text('home'),
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
