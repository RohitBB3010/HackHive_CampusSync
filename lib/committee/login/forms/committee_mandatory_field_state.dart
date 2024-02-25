import 'package:campus_sync/committee/login/states/check_state.dart';
import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:formz/formz.dart';

part 'committee_mandatory_field_state.g.dart';

@CopyWith()
class CommitteeMandatoryFieldState extends CheckCommitteeState with FormzMixin {
  CommitteeMandatoryFieldState({
    this.name = const RequiredTextInput.pure(),
    this.convener = const RequiredTextInput.pure(),
    this.email = const Email.pure(),
    this.initialFieldsRendered = false,
    this.hasConvener = false,
    this.hasEmail = false,
    this.hasName = false,
  });

  final RequiredTextInput name;
  final RequiredTextInput convener;
  final Email email;
  final bool initialFieldsRendered;
  bool hasEmail;
  bool hasName;
  bool hasConvener;

  @override
  List<FormzInput> get inputs => [name, email, convener];
}

class CommitteeDataFilledActionState extends CommitteeMandatoryFieldState {}
