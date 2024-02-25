import 'package:campus_sync/committee/login/forms/committee_mandatory_state.dart';
import 'package:campus_sync/committee/login/models/committee.dart';
import 'package:campus_sync/committee/login/states/check_state.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:campus_sync/form_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommitteeMandatoryFieldsCubit extends Cubit<CommitteeMandatoryState> {
  CommitteeMandatoryFieldsCubit() : super(CommitteeMandatoryState());

  bool initialDataRendered = false;

  void fetchMandatoryFieldsData(String userId) {
    FirebaseFirestore.instance
        .collection(FBCommitteeConsts.FieldCommittee)
        .doc(userId)
        .get()
        .then((value) {
      final committee = Committee.fromJson(value.data()!);

      emit(state.copyWith(
          committeeName: RequiredTextInput.dirty(committee.committeeName!),
          committeeEmail: Email.dirty(committee.committeeEmail!),
          convener: RequiredTextInput.dirty(committee.convener!),
          members: committee.members,
          initialDataRendered: true));
    });
  }

  void setUpdateCommitteeMandatoryFields(String userId) {
    final committee = Committee(
        committeeName: state.committeeName.value,
        committeeEmail: state.committeeEmail.value,
        convener: state.convener.value,
        members: state.members);

    FirebaseFirestore.instance
        .collection(FBCommitteeConsts.FieldCommittee)
        .doc(userId)
        .set(committee.toJson(), SetOptions(merge: true))
        .then((value) => emit(CommitteeDataFilledState()));
  }

  void committeeNameChanged(String value) {
    final committeeName = RequiredTextInput.dirty(value);
    emit(state.copyWith(
      committeeName: committeeName,
    ));
  }

  void committeeEmailChanged(String value) {
    final committeeEmail = Email.dirty(value);
    emit(state.copyWith(
      committeeEmail: committeeEmail,
    ));
  }

  void committeeConvenerChanged(String value) {
    final convener = RequiredTextInput.dirty(value);
    emit(state.copyWith(
      convener: convener,
    ));
  }

  Future<void> checkDetailsFilled(String userID) async {
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(FBCommitteeConsts.FieldCommittee)
        .doc(userID)
        .get();

    if (snapshot.data() != null) {
      final data = snapshot.data()! as Map<String, dynamic>;

      final hasEmail =
          data.containsKey(FBCommitteeConsts.fieldCommitteeEmail) &&
              data[FBCommitteeConsts.fieldCommitteeEmail] != null;
      final hasName = data.containsKey(FBCommitteeConsts.fieldCommitteeName) &&
          data[FBCommitteeConsts.fieldCommitteeName] != null;
      final hasConvener = data.containsKey(FBCommitteeConsts.fieldConvener) &&
          data[FBCommitteeConsts.fieldConvener] != null;

      emit(state.copyWith(
        hasCommitteeEmail: hasEmail,
        hasConvener: hasConvener,
        hasCommitteeName: hasName,
      ));
    }
  }
}
