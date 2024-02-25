import 'package:bloc/bloc.dart';
import 'package:campus_sync/committee/login/forms/committee_mandatory_field_state.dart';
import 'package:campus_sync/committee/login/models/committee.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:campus_sync/form_fields.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CommitteeMandatoryFieldsCubit
    extends Cubit<CommitteeMandatoryFieldState> {
  CommitteeMandatoryFieldsCubit() : super(CommitteeMandatoryFieldState());

  bool initialDataRendered = false;

  void fetchMandatoryFieldsData(String userID) {
    FirebaseFirestore.instance
        .collection(FBCommitteeConsts.collCommittee)
        .doc(userID)
        .get()
        .then((value) {
      final committee = Committee.fromJson(value.data()!);

      emit(
        state.copyWith(
          name: RequiredTextInput.dirty(committee.committeeName),
          email: Email.dirty(committee.email),
          convener: RequiredTextInput.dirty(committee.committeeConvener),
          initialFieldsRendered: true,
        ),
      );
    });
  }

  void setUpdateMandatoryFields(String userID) {
    final committee = Committee(
        committeeName: state.name.value,
        committeeConvener: state.convener.value,
        email: state.email.value,
        members: []);

    FirebaseFirestore.instance
        .collection(FBCommitteeConsts.collCommittee)
        .doc(userID)
        .set(committee.toJson(), SetOptions(merge: true))
        .then((value) {
      emit(CommitteeDataFilledActionState());
    });
  }

  void nameChanged(String value) {
    final name = RequiredTextInput.dirty(value);
    emit(
      state.copyWith(
        name: name,
      ),
    );
  }

  void conveverChanged(String value) {
    final convener = RequiredTextInput.dirty(value);
    emit(state.copyWith(
      convener: convener,
    ));
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  Future<void> checkDetailsFilled(String userID) async {
    // Checks if details such as email, phone and name are filled

    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(FBCommitteeConsts.collCommittee)
        .doc(userID)
        .get();

    final data = snapshot.data() as Map<String, dynamic>?;
    final hasEmail = data!.containsKey(FBCommitteeConsts.fieldEmail) &&
        data[FBCommitteeConsts.fieldEmail] != null;
    final hasConvener = data.containsKey(FBCommitteeConsts.fieldConvener) &&
        data[FBCommitteeConsts.fieldConvener] != null;

    final hasName = data.containsKey(FBCommitteeConsts.fieldName) &&
        data[FBCommitteeConsts.fieldName] != null;

    emit(
      state.copyWith(
        hasEmail: hasEmail,
        hasConvener: hasConvener,
        hasName: hasName,
      ),
    );
  }
}
