import 'package:bloc/bloc.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:campus_sync/committee/login/states/check_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckCommitteeCubit extends Cubit<CheckCommitteeState> {
  CheckCommitteeCubit() : super(CheckCommitteeState());

  Future<void> checkUserDataStatus(String userID) async {
    emit(CommitteeCheckLoadingState());
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(FBCommitteeConsts.collCommittee)
        .doc(userID)
        .get();

    final data = snapshot.data()! as Map<String, dynamic>;

    final hasEmail = data.containsKey(FBCommitteeConsts.fieldEmail) &&
        data[FBCommitteeConsts.fieldEmail] != null;
    final hasName = data.containsKey(FBCommitteeConsts.fieldName) &&
        data[FBCommitteeConsts.fieldName] != null;
    final hasPhoneNo = data.containsKey(FBCommitteeConsts.fieldPhone) &&
        data[FBCommitteeConsts.fieldPhone] != null;
    // final hasDob = data.containsKey(FBCommitteeConsts.fieldDob) &&
    //     data[FBCommitteeConsts.fieldDob] != null;

    if (hasName && hasPhoneNo && hasEmail) {
      emitAllDataPresentState();
    } else {
      emit(CommitteeDataUnavailableState());
    }
  }

  void emitAllDataPresentState() {
    emit(CommitteeAllDataPresentState());
  }
}
