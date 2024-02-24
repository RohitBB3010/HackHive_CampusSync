import 'package:bloc/bloc.dart';
import 'package:campus_sync/auth/states/sign_up_state.dart';
import 'package:campus_sync/form_fields.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState());

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
      ),
    );
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = Password.dirty(value);
    emit(
      state.copyWith(
        confirmPassword: confirmPassword,
      ),
    );
  }
}
