import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:campus_sync/authority/login/states/check_state.dart';
import 'package:formz/formz.dart';

part 'authority_mandatory_field_state.g.dart';

@CopyWith()
class AuthorityMandatoryFieldState extends CheckAuthorityState with FormzMixin {
  AuthorityMandatoryFieldState({
    this.name = const RequiredTextInput.pure(),
    this.email = const Email.pure(),
    this.phone = const Phone.pure(),
    this.initialFieldsRendered = false,
    this.committee = const Field.pure(),
    this.hasEmail = false,
    this.hasPhoneNo = false,
    this.hasName = false,
    this.hasRole = false,
    this.role = const Role.pure(),
  });

  final RequiredTextInput name;
  final Phone phone;
  final Email email;
  final Role role;
  final bool initialFieldsRendered;
  final Field committee;
  bool hasEmail;
  bool hasPhoneNo;
  bool hasName;
  bool hasRole;

  @override
  List<FormzInput> get inputs => [name, phone, email, role, committee];
}

class AuthorityDataFilledActionState extends AuthorityMandatoryFieldState {}
