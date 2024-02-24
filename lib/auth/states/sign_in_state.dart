import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:formz/formz.dart';

part 'sign_in_state.g.dart';

@CopyWith()
class SignInState with FormzMixin {
  const SignInState({
    this.password = const Password.pure(),
  });

  final Password password;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [password];

  SignInState copyWith({
    Password? password,
  }) {
    return SignInState(
      password: password ?? this.password,
    );
  }
}
