import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:campus_sync/home/states/check_state.dart';
import 'package:formz/formz.dart';

part 'mandatory_field_state.g.dart';

@CopyWith()
class MandatoryFieldState extends CheckState with FormzMixin {
  MandatoryFieldState({
    this.name = const RequiredTextInput.pure(),
    this.email = const Email.pure(),
    this.phone = const Phone.pure(),
    this.initialFieldsRendered = false,
    this.hasEmail = false,
    this.hasPhoneNo = false,
    this.hasName = false,
  });

  final RequiredTextInput name;
  final Phone phone;
  final Email email;
  final bool initialFieldsRendered;
  bool hasEmail;
  bool hasPhoneNo;
  bool hasName;

  @override
  List<FormzInput> get inputs => [
        name,
        phone,
        email,
      ];
}

class DataFilledActionState extends MandatoryFieldState {}
