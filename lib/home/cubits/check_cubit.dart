import 'package:bloc/bloc.dart';
import 'package:campus_sync/consts/fb_user.dart';
import 'package:campus_sync/home/states/check_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckState());

  Future<void> checkUserDataStatus(String userID) async {
    emit(CheckLoadingState());
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(FBUserConsts.collUsers)
        .doc(userID)
        .get();

    final data = snapshot.data()! as Map<String, dynamic>;

    final hasEmail = data.containsKey(FBUserConsts.fieldEmail) &&
        data[FBUserConsts.fieldEmail] != null;
    final hasName = data.containsKey(FBUserConsts.fieldName) &&
        data[FBUserConsts.fieldName] != null;
    final hasPhoneNo = data.containsKey(FBUserConsts.fieldPhone) &&
        data[FBUserConsts.fieldPhone] != null;
    // final hasDob = data.containsKey(FBUserConsts.fieldDob) &&
    //     data[FBUserConsts.fieldDob] != null;

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
