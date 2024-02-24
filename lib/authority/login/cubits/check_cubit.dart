import 'package:bloc/bloc.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:campus_sync/student/login/states/check_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckState());

  Future<void> checkUserDataStatus(String userID) async {
    emit(CheckLoadingState());
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(FBAuthorityConsts.collAuthority)
        .doc(userID)
        .get();

    final data = snapshot.data()! as Map<String, dynamic>;

    final hasEmail = data.containsKey(FBAuthorityConsts.fieldEmail) &&
        data[FBAuthorityConsts.fieldEmail] != null;
    final hasName = data.containsKey(FBAuthorityConsts.fieldName) &&
        data[FBAuthorityConsts.fieldName] != null;
    final hasPhoneNo = data.containsKey(FBAuthorityConsts.fieldPhone) &&
        data[FBAuthorityConsts.fieldPhone] != null;
    // final hasDob = data.containsKey(FBAuthorityConsts.fieldDob) &&
    //     data[FBAuthorityConsts.fieldDob] != null;

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
