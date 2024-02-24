import 'package:bloc/bloc.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:campus_sync/student/login/states/check_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckState());

  Future<void> checkUserDataStatus(String userID) async {
    emit(CheckLoadingState());
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(FBStudentConsts.collStudents)
        .doc(userID)
        .get();

    final data = snapshot.data()! as Map<String, dynamic>;

    final hasEmail = data.containsKey(FBStudentConsts.fieldEmail) &&
        data[FBStudentConsts.fieldEmail] != null;
    final hasName = data.containsKey(FBStudentConsts.fieldName) &&
        data[FBStudentConsts.fieldName] != null;
    final hasPhoneNo = data.containsKey(FBStudentConsts.fieldPhone) &&
        data[FBStudentConsts.fieldPhone] != null;
    // final hasDob = data.containsKey(FBStudentConsts.fieldDob) &&
    //     data[FBStudentConsts.fieldDob] != null;

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
