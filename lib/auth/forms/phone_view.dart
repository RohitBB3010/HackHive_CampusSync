import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_sync/auth/cubits/auth_cubit.dart';
import 'package:campus_sync/auth/cubits/phone_cubit.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/auth/states/phone_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:campus_sync/components/custom_text_field.dart';
import 'package:campus_sync/components/elevated_button.dart';
import 'package:campus_sync/consts/empty_spaces.dart';
import 'package:campus_sync/components/text_button.dart';

class PhoneView extends StatelessWidget {
  const PhoneView({super.key});

  //const PhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = context.watch<AuthCubit>();

    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    if (screenWidth > 500) {
      return BlocProvider(
        create: (context) => PhoneCubit(),
        child: BlocBuilder<PhoneCubit, PhoneState>(
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    autoSizeText(),
                    heightBetweenFields_1(context),
                    phoneNumberField(context, authCubit, screenWidth),
                    heightBetweenFields_1(context),
                    enterOtpField(context, screenWidth),
                    heightBetweenFields_1(context),
                    verifyOtpButton(authCubit, state),
                    heightBetweenFields_1(context),
                    CustomTextButton(
                      onPressed: authCubit.returnToLoginPage,
                      title: 'Back to Login Page',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    } else {
      return BlocProvider(
        create: (context) => PhoneCubit(),
        child: BlocBuilder<PhoneCubit, PhoneState>(
          builder: (context, state) {
            return SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    autoSizeText(),
                    heightBetweenFields_1(context),
                    phoneNumberField(context, authCubit, screenWidth),
                    heightBetweenFields_1(context),
                    enterOtpField(context, screenWidth),
                    heightBetweenFields_1(context),
                    verifyOtpButton(authCubit, state),
                    heightBetweenFields_1(context),
                    CustomTextButton(
                      onPressed: authCubit.returnToLoginPage,
                      title: 'Back to Login Page',
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}

Widget autoSizeText() {
  return const AutoSizeText(
    "Let's get you in",
    style: TextStyle(fontSize: 30, fontFamily: 'Euclid'),
    maxLines: 1,
  );
}

Widget enterOtpField(BuildContext context, double screenWidth) {
  return SizedBox(
    width: screenWidth * 0.9,
    child: CustomTextField(
        labelText: 'Enter your OTP',
        icon: Icons.password,
        onChanged: context.read<PhoneCubit>().otpChanged,
        validator: (value) {
          return value!.length < 6 == true
              ? 'OTP cannot be less than 6 digits'
              : null;
        }),
  );
}

Widget phoneNumberField(
    BuildContext context, AuthCubit authCubit, double screenWidth) {
  return SizedBox(
    width: screenWidth * 0.9,
    child: CustomTextField(
      enabled: false,
      icon: Icons.phone,
      initialValue: (authCubit.state as PhoneAuthState).phoneNumber,
    ),
  );
}

Widget verifyOtpButton(AuthCubit authCubit, PhoneState state) {
  return CustomElevatedButton(
    title: 'Verify OTP',
    onPressed: () {
      if (authCubit.state is OTPSentForWeb) {
        authCubit.signInWithWebOTP(
          state.otp.value,
          (authCubit.state as OTPSentForWeb).confirmationResult,
        );
      }
      if (authCubit.state is PhoneVerificationSent) {
        authCubit.signInWithVerificationCode(
          state.otp.value,
          (authCubit.state as PhoneVerificationSent).verificationId,
        );
      }
    },
    icon: Icons.check,
    //color: Colors.deepPurple,
  );
}
