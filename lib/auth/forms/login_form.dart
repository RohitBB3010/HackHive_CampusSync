import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/components/customDropDown.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:campus_sync/components/custom_text_field.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/consts/empty_spaces.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class TextString {
  static const String enterEmailPhone = 'Enter Email/Phone (without +91)';
  static const String submit = 'Submit';
  static const String validPhone = 'Please enter a valid phone number';
  static const String validEmail = 'Please enter a valid email address';
}

class LoginForm extends StatelessWidget {
  LoginForm({
    super.key,
  });

  final List<String> userType = ['Authority', 'Committee', 'Student'];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            CustomDropDown(
                items: userType.map((e) {
                  return DropdownMenuItem<String>(
                      value: e, child: AutoSizeText(e));
                }).toList(),
                dropdownHeight: MediaQuery.of(context).size.height * 0.05,
                dropdownWidth: MediaQuery.of(context).size.width * 0.05,
                hint: const AutoSizeText('Selec user type')),
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
