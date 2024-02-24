import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:campus_sync/components/custom_text_field.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/consts/empty_spaces.dart';

class TextString {
  static const String enterEmailPhone = 'Enter Email/Phone (without +91)';
  static const String submit = 'Submit';
  static const String validPhone = 'Please enter a valid phone number';
  static const String validEmail = 'Please enter a valid email address';
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authState = authCubit.state;

      if (authState is UnverifiedEmailAuthState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Email Unverified'),
            action: SnackBarAction(
              label: 'Resend Verification Link',
              onPressed: () {
                try {
                  FirebaseAuth.instance.currentUser?.sendEmailVerification();
                } catch (e) {
                  debugPrint('$e');
                }
              },
            ),
          ),
        );
      }
    });

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const FlutterLogo(
            //   size: 150,
            // ),

            SizedBox(
              width: screenWidth * 0.9,
              child: CustomTextField(
                  onChanged: context.read<AuthCubit>().textValueChanged,
                  labelText: TextString.enterEmailPhone,
                  icon: Icons.person,
                  validator: (value) {
                    if (double.tryParse(value!) != null && value.length < 10) {
                      return TextString.validPhone;
                    } else if (value.contains('@') != true &&
                        value.isNotEmpty &&
                        value.length != 10) {
                      return TextString.validEmail;
                    }
                    return null;
                  }),
            ),
            heightBetweenFields_1(context),
            CustomElevatedButton(
              title: 'Submit',
              icon: FontAwesomeIcons.check,
              //color: ButtonThemeData,
              onPressed: context.read<AuthCubit>().onClickSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
