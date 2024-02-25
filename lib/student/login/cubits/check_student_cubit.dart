import 'package:bloc/bloc.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:campus_sync/student/login/states/check_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CheckStudentCubit extends Cubit<CheckStudentState> {
  CheckStudentCubit() : super(CheckStudentState());

  Future<void> checkUserDataStatus(String userID) async {
    // emit(StudentCheckLoadingState());
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

    if (hasName && hasPhoneNo && hasEmail) {
      emitAllDataPresentState();
    } else {
      emit(StudentDataUnavailableState());
    }
  }

  void emitAllDataPresentState() {
    emit(StudentAllDataPresentState());
  }
}
