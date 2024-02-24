import 'package:bloc/bloc.dart';
import 'package:campus_sync/auth/states/sign_in_state.dart';
import 'package:campus_sync/form_fields.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState());

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
      ),
    );
  }
}
