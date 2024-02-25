import 'package:campus_sync/committee/login/states/check_state.dart';
import 'package:campus_sync/form_fields.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:formz/formz.dart';

part 'committee_mandatory_state.g.dart';

@CopyWith()
class CommitteeMandatoryState extends CheckCommitteeState with FormzMixin {
  CommitteeMandatoryState({
    this.committeeName = const RequiredTextInput.pure(),
    this.committeeEmail = const Email.pure(),
    this.convener = const RequiredTextInput.pure(),
    this.initialDataRendered = false,
    this.hasCommitteeName = false,
    this.hasCommitteeEmail = false,
    this.hasConvener = false,
    this.members = const [],
  });

  final RequiredTextInput committeeName;
  final Email committeeEmail;
  final RequiredTextInput convener;
  final List<String> members;
  bool hasCommitteeName;
  bool hasCommitteeEmail;
  bool hasConvener;
  bool initialDataRendered;
  @override
  List<FormzInput> get inputs => [committeeName, committeeEmail, convener];
}

class CommitteeDataFilledState extends CommitteeMandatoryState {}
