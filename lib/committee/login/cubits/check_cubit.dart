import 'package:bloc/bloc.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:campus_sync/student/login/states/check_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckState());

  Future<void> checkUserDataStatus(String userID) async {
    emit(CheckLoadingState());
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
      emit(DataUnavailableState());
    }
  }

  void emitAllDataPresentState() {
    emit(AllDataPresentState());
  }
}
