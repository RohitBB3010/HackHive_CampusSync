import 'package:bloc/bloc.dart';
import 'package:campus_sync/auth/states/auth_state.dart';
import 'package:campus_sync/form_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthUnauthenticatedState());

  FirebaseAuth auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? userName;

  String get uid => auth.currentUser!.uid;

  Future<String> getAuthToken() async {
    final token = await auth.currentUser!.getIdTokenResult();
    return token.token!;
  }

  void checkAuth() {
    if (auth.currentUser != null) {
      emit(AuthLoadingState());
      // fetchData();
      emit(AuthAuthenticatedState());
    } else {
      emit(AuthUnauthenticatedState());
    }
  }

  void forGoogleAuth() {
    emit(GoogleAuthInitialState());
  }

  Future<bool> checkUserExists(String email) async {
    final usersRef = FirebaseFirestore.instance.collection('users');
    final snapshot =
        await usersRef.where('email', isEqualTo: email).limit(1).get();
    return snapshot.docs.isNotEmpty;
  }

  Future<void> onEnterScreenSubmit() async {
    if (state is AuthUnauthenticatedState) {
      final currState = state as AuthUnauthenticatedState;
      if (currState.field.value.length == 10) {
        emit(OTPRequestedState(currState.field.value));
      } else {
        final condition = await checkUserExists(currState.email.value);
        if (condition) {
          emit(EmailSignInState(currState.email.value, false));
        } else {
          emit(EmailSignUpState(currState.email.value, true, true, false));
        }
      }
    }
  }

  //Creating a textchanged field to emit state when user type anything
  void textValueChanged(String value) {
    final field = Field.dirty(value);
    emit((state as AuthUnauthenticatedState).copyWith(field: field));
  }

  Future<void> signIn({required String email, required String password}) async {
    try {
      await auth.currentUser?.reload();
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!auth.currentUser!.emailVerified) {
        emit(
          UnverifiedEmailAuthState(email, false),
        );
        return;
      }
      //await fetchData();
      emit(AuthAuthenticatedState());
    } on FirebaseAuthException catch (error) {
      if (error.code.contains('user-not-found')) {
        emit(
          EmailSignInErrorState(
            email,
            true,
            'No user found for that email.',
          ),
        );
        return;
      }

      if (error.code.contains('wrong-password')) {
        emit(
          EmailSignInErrorState(
            email,
            true,
            'Wrong password provided for that user.',
          ),
        );
        return;
      }

      if (error.code.contains('too-many-requests')) {
        emit(
          EmailSignInErrorState(
            email,
            true,
            'Too many failed attempts. Try again later.',
          ),
        );
      }
    } catch (error) {
      debugPrint('Error signing in: $error');
      emit(
        EmailSignInErrorState(
          email,
          true,
          'Error signing in. Please contact support.',
        ),
      );
    }
  }

//Function to toggle password visibility for Sign In
  void togglePasswordVisibilitySignIn() {
    if (state is EmailSignInState) {
      final currentState = state as EmailSignInState;
      debugPrint('Current state is : $currentState');
      emit(EmailSignInState(
          currentState.email, !currentState.isPasswordVisible));
    } else if (state is UnverifiedEmailAuthState) {
      final currentState = state as UnverifiedEmailAuthState;
      debugPrint('Current state is : ${currentState}');
      emit(UnverifiedEmailAuthState(
          currentState.email, !currentState.isPasswordVisible));
    } else if (state is EmailVerificationLinkSent) {
      final currentState = state as EmailVerificationLinkSent;
      debugPrint('Current state is : $currentState');
      emit(EmailVerificationLinkSent(
          currentState.email, !currentState.isPasswordVisible));
    }
  }

  //Function to toggle password visibility for Sign up password
  void togglePasswordVisibilitySignUpPassword() {
    final currentState = state as EmailSignUpState;
    emit(
      EmailSignUpState(
        currentState.email,
        !currentState.isPasswordVisible,
        currentState.isConfirmPasswordVisible,
        currentState.isEmailVerified,
      ),
    );
  }

  //Function to toggle password visibility for Sign up confirm password
  void togglePasswordVisibilitySignUpConfirmPassword() {
    final currentState = state as EmailSignUpState;
    emit(
      EmailSignUpState(
        currentState.email,
        currentState.isPasswordVisible,
        !currentState.isConfirmPasswordVisible,
        currentState.isEmailVerified,
      ),
    );
  }

  Future<void> signInWithPhone(String phoneNumber) async {
    final formattedPhoneNumber = '+91$phoneNumber';
    try {
      verificationCompleted(PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        await enableLogging();
        // await fetchData();
      }

      verificationFailed(FirebaseAuthException e) {
        debugPrint('Error signing in verificatin failed: $e');
        debugPrint('Error code: ${e.code}');
        debugPrint('Error message: ${e.message}');
        emit(AuthUnauthenticatedState());
      }

      codeSent(String verificationId, int? resendToken) {
        emit(PhoneVerificationSent(verificationId, resendToken!, phoneNumber));
      }

      codeAutoRetrievalTimeout(String verificationId) {
        debugPrint('Code auto retrieval timeout');
        emit(PhoneAutoRetrievalTimeout(verificationId, phoneNumber));
      }

      if (kIsWeb) {
        final confirmationResult = await auth
            .signInWithPhoneNumber(phoneNumber = formattedPhoneNumber);
        emit(OTPSentForWeb(confirmationResult, phoneNumber));
      } else {
        await auth.verifyPhoneNumber(
          phoneNumber: formattedPhoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
        );
      }
    } on FirebaseAuthException catch (error) {
      // if (error.code.contains('invalid-verification-code')) {
      //   emit(
      //     OTPMismatchState(),
      //   );
      //   Future.delayed(const Duration(seconds: 3), () {
      //     emit(PhoneVerificationSent(verificationId, rToken!));
      //   });
      //   return;
      // }
    }
  }

  Future<void> passwordReset(String email) async {
    await auth.sendPasswordResetEmail(email: email);
    emit(EmailPasswordResetLinkSent(email, false));
  }

  void returnToLoginPage() {
    emit(AuthUnauthenticatedState());
  }

  Future<void> signInWithWebOTP(
    String smsCode,
    ConfirmationResult confirmationResult,
  ) async {
    try {
      final userCredential = await confirmationResult.confirm(smsCode);

      await createUserIfNotExists(
        userCredential,
        'phone',
        userCredential.user!.phoneNumber!,
      );
      // await fetchData();
      emit(AuthAuthenticatedState());
    } catch (e) {
      debugPrint('Error signing in: $e');
      emit(AuthUnauthenticatedState());
    }
  }

  Future<void> signInWithVerificationCode(
    String verificationCode,
    String verificationId,
  ) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: verificationCode,
      );

      final userCred = await auth.signInWithCredential(credential);

      // Create user in firestore if it doesn't exist
      await createUserIfNotExists(
        userCred,
        'phone',
        userCred.user!.phoneNumber!,
      );
      // await fetchData();
    } catch (e) {
      debugPrint('Error signing in: $e');
      emit(AuthUnauthenticatedState());
    }
  }

  Future<void> createUserIfNotExists(
    UserCredential userCred,
    String fieldName,
    String fieldValue,
  ) async {
    // Create user in firestore if it doesn't exist

    final userDoc =
        await firestore.collection('users').doc(userCred.user!.uid).get();

    if (!userDoc.exists) {
      await enableLogging();

      await firestore
          .collection('users')
          .doc(userCred.user!.uid)
          .set({fieldName: fieldValue});
    }
  }

  Future<void> enableLogging() async {
    final headers = {
      'Authorization': await getAuthToken(),
      'Content-Type': 'application/json',
    };

    try {
      // await http.post(
      //   Uri.parse(
      //     '${APIConsts.BASE_URL}${APIConsts.ENABLE_LOGGING}',
      //   ),
      //   headers: headers,
      //   body: json.encode({
      //     'id': true,
      //   }),
      // );

      // propagate custom claims to the client so that it can be used in firestore security rules
      await auth.currentUser!.getIdTokenResult(true);
      await auth.currentUser!.reload();
    } catch (e) {
      debugPrint('Error enabling logging: $e');
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((userCredential) async {
      await enableLogging().then((_) async {
        await firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({'email': email}).catchError((onError) {
          debugPrint('Error adding doc $onError');
        });
      });
    });
    await auth.currentUser?.sendEmailVerification().catchError(
          (error) => debugPrint('Error sending email verification $onError'),
        );
    await auth.signOut();
    emit(EmailVerificationLinkSent(email, false));
  }

  void signOut() {
    auth.signOut().then((value) async {
      await FirebaseFirestore.instance.terminate();
      // if (kIsWeb) {
      //   html.window.location.reload();
      // }
      emit(AuthUnauthenticatedState());
    }).catchError((error) {
      debugPrint('Error signing out: $error');
    });
  }

  bool checkStringType(String value) {
    // Checks if the String entered is a numeric string or not
    if (double.tryParse(value) != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> onClickSubmit() async {
    // Emits appropriate way to sign in or sign up based on the input
    if (state is AuthUnauthenticatedState) {
      final currState = state as AuthUnauthenticatedState;
      final inputStatus = checkStringType(currState.field.value);

      if (inputStatus == true && currState.field.value.length == 10) {
        emit(OTPRequestedState(currState.field.value));
      } else {
        final signCondition = await checkUserExists(currState.field.value);
        if (signCondition) {
          emit(EmailSignInState(currState.field.value, true));
        } else {
          emit(EmailSignUpState(currState.field.value, true, true, false));
        }
      }
    }
  }

  // bool isNotEmpty(String value) {
  //   if (value.isNotEmpty) {
  //     emit(state.copyWith(isButtonEnabled: true));
  //   } else {
  //     emit(state.copyWith(isButtonEnabled: false));
  //   }
  //   return state.isButtonEnabled;
  // }
}
