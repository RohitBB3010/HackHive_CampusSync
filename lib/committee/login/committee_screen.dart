import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/login.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/committee/login/committee_mandatory_fields.dart';
import 'package:campus_sync/committee/login/cubits/check_committee_cubit.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/committee/login/states/check_state.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CommitteeScreen extends StatelessWidget {
  CommitteeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit()..checkAuth(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, authState) {
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
      create: (context) => CheckCommitteeCubit()
        ..checkUserDataStatus(context.read<AuthCubit>().uid),
      child: BlocBuilder<CheckCommitteeCubit, CheckCommitteeState>(
        builder: (context, state) {
          if (state is CommitteeDataUnavailableState) {
            return CommitteeMandatoryFields();
          } else if (state is CommitteeCheckLoadingState) {
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
