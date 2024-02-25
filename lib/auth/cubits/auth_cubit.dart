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

  String userName = '';
  String? usersType;
  String? type;

  String get uid => auth.currentUser!.uid;

  Future<String> getAuthToken() async {
    final token = await auth.currentUser!.getIdTokenResult();
    return token.token!;
  }

  void checkAuth() async {
    if (auth.currentUser != null) {
      // debugPrint(
      //     'usertype - ${(state as AuthUnauthenticatedState).userType.value}');
      emit(AuthLoadingState());
      type = auth.currentUser!.displayName;
      this.usersType = type;
      debugPrint('type - ${type}');
      // fetchData();
      if (type == 'Student') {
        emit(StudentSignInState());
      } else if (type == 'Authority') {
        emit(AuthoritySignInState());
      } else if (type == 'Committee') {
        emit(CommitteeSignInState());
      }
      emit(AuthAuthenticatedState());
    } else {
      emit(AuthUnauthenticatedState());
    }
  }

  // Future<void> getUserRole() async {
  //   final usersRef = FirebaseFirestore.instance.collection(usersType);
  //   final snapshot =
  //       await usersRef.where('email', isEqualTo: email).limit(1).get();
  // }

  void setUserType(String? userType) {
    final userTypeValue = userTypeFormz.dirty(userType != null ? userType : '');
    debugPrint('IN set function : $userTypeValue');
    usersType = userTypeValue.value;
    emit((state as AuthUnauthenticatedState).copyWith(userType: userTypeValue));
  }

  Future<bool> checkUserExists(String email, String userType) async {
    // debugPrint(
    //     'from checkUserExists - ${(state as AuthUnauthenticatedState).userType.value}');
    debugPrint('usertype - $userType');
    final usersRef = FirebaseFirestore.instance.collection(userType);
    final snapshot =
        await usersRef.where('email', isEqualTo: email).limit(1).get();
    return snapshot.docs.isNotEmpty;
  }

  Future<void> onEnterScreenSubmit() async {
    if (state is AuthUnauthenticatedState) {
      final currState = state as AuthUnauthenticatedState;

      final condition = await checkUserExists(
          currState.email.value, currState.userType.value);
      if (condition) {
        emit(EmailSignInState(currState.email.value, false));
      } else {
        emit(EmailSignUpState(currState.email.value, true, true, false,
            currState.userType.value));
      }
    }
  }

  //Creating a textchanged field to emit state when user type anything
  void textValueChanged(String value) {
    final field = Field.dirty(value);
    emit((state as AuthUnauthenticatedState).copyWith(field: field));
  }

  Future<void> signIn(
      {required String email,
      required String password,
      String? userType}) async {
    try {
      await auth.currentUser?.reload();
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      type = 'Student';
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
        currentState.userType,
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
        currentState.userType,
      ),
    );
  }

  Future<void> passwordReset(String email) async {
    await auth.sendPasswordResetEmail(email: email);
    emit(EmailPasswordResetLinkSent(email, false));
  }

  void returnToLoginPage() {
    emit(AuthUnauthenticatedState());
  }

  Future<void> enableLogging() async {
    try {
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
            .collection(usersType!)
            .doc(userCredential.user!.uid)
            .set({'email': email, 'userRole': usersType}).catchError((onError) {
          debugPrint('Error adding doc $onError');
        });
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection(usersType!)
            .doc(userCredential.user!.uid)
            .get();
        userCredential.user!.updateDisplayName(usersType);
        Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
        type = userData['userRole'];
        debugPrint('type = from signup = $type');
      });
    });

    await auth.signOut();
    // emit(EmailSignInState(email, false));
    emit(AuthUnauthenticatedState());
  }

  void signOut() {
    auth.signOut().then((value) async {
      await FirebaseFirestore.instance.terminate();

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

      final signCondition = await checkUserExists(
          currState.field.value, currState.userType.value);
      if (signCondition) {
        emit(EmailSignInState(currState.field.value, true));
      } else {
        emit(EmailSignUpState(currState.field.value, true, true, false,
            currState.userType.value));
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
