import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:formz/formz.dart';

part 'phone_state.g.dart';

@CopyWith()
class PhoneState with FormzMixin {
  const PhoneState({
    this.otp = const OTP.pure(),
  });

  final OTP otp;

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [otp];
}
