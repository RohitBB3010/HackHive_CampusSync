import 'package:campus_sync/committee/login/states/check_state.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckCommitteeCubit extends Cubit<CheckCommitteeState> {
  CheckCommitteeCubit() : super(CheckCommitteeState());

  Future<void> checkCommitteeDataStatus(String userID) async {
    emit(CommitteeCheckLoadingState());
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

      if (hasConvener && hasName && hasEmail) {
        emitAllDataPresentState;
      } else {
        emit(CommitteeDataUnavailableState());
      }
    }
  }

  void emitAllDataPresentState() {
    emit(CommitteeAllDataPresentState());
  }
}
