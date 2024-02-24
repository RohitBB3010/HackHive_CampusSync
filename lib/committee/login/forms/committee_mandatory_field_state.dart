import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:campus_sync/student/login/states/check_state.dart';
import 'package:formz/formz.dart';

part 'committee_mandatory_field_state.g.dart';

@CopyWith()
class CommitteeMandatoryFieldState extends CheckState with FormzMixin {
  CommitteeMandatoryFieldState({
    this.name = const RequiredTextInput.pure(),
    this.email = const Email.pure(),
    this.phone = const Phone.pure(),
    this.initialFieldsRendered = false,
    this.hasEmail = false,
    this.hasPhoneNo = false,
    this.hasName = false,
    this.role = const Role.pure(),
  });

  final RequiredTextInput name;
  final Phone phone;
  final Email email;
  final Role role;
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

class CommitteeDataFilledActionState extends CommitteeMandatoryFieldState {}
