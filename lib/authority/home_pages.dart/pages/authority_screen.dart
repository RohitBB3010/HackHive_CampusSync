import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/login.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/authority/authority_bottom_nav.dart';
import 'package:campus_sync/authority/login/authority_mandatory_fields.dart';
import 'package:campus_sync/authority/login/cubits/check_authority_cubit.dart';
import 'package:campus_sync/components/custom_appBar.dart';
import 'package:campus_sync/authority/login/states/check_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorityScreen extends StatelessWidget {
  const AuthorityScreen({super.key});

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
      create: (context) => CheckAuthorityCubit()
        ..checkUserDataStatus(context.read<AuthCubit>().uid),
      child: BlocBuilder<CheckAuthorityCubit, CheckAuthorityState>(
        builder: (context, state) {
          if (state is AuthorityDataUnavailableState) {
            return AuthorityMandatoryFields();
          } else if (state is AuthorityCheckLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return BlocProvider(
              create: (context) => AuthCubit(),
              child: SafeArea(
                child: Scaffold(
                  appBar: CustomAppBar(
                    icon: Icons.person,
                    appBarHeight: MediaQuery.of(context).size.height * 0.07,
                    context: context,
                    titleText: 'Authority',
                  ),
                  body: const AutoSizeText('Rohit'),
                  bottomNavigationBar: const AuthorityBottomNavbar(),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
