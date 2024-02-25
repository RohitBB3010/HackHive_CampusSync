import 'package:campus_sync/components/custom_appBar.dart';
import 'package:flutter/material.dart';

class AuthorityProfile extends StatelessWidget {
  const AuthorityProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(titleText: 'Profile', context: context),
      bottomNavigationBar: (BottomAppBar()),
    );
  }
}
