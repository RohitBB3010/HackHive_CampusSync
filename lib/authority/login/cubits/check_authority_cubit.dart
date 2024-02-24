import 'package:bloc/bloc.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:campus_sync/authority/login/states/check_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckAuthorityCubit extends Cubit<CheckAuthorityState> {
  CheckAuthorityCubit() : super(CheckAuthorityState());

  Future<void> checkUserDataStatus(String userID) async {
    emit(AuthorityCheckLoadingState());
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
      emit(AuthorityDataUnavailableState());
    }
  }

  void emitAllDataPresentState() {
    emit(AuthorityAllDataPresentState());
  }
}
