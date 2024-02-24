import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:formz/formz.dart';

part 'sign_up_state.g.dart';

@CopyWith()
class SignUpState with FormzMixin {
  const SignUpState({
    this.password = const Password.pure(),
    this.confirmPassword = const Password.pure(),
  });

  final Password password;
  final Password confirmPassword;

  @override
  List<FormzInput> get inputs => [password, confirmPassword];
}
