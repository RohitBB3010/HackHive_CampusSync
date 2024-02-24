import 'package:bloc/bloc.dart';
import 'package:campus_sync/consts/fb_user.dart';
import 'package:campus_sync/form_fields.dart';
import 'package:campus_sync/home/forms/mandatory_field_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:campus_sync/home/models/user.dart';

class MandatoryFieldsCubit extends Cubit<MandatoryFieldState> {
  MandatoryFieldsCubit() : super(MandatoryFieldState());

  bool initialDataRendered = false;

  void fetchMandatoryFieldsData(String userID) {
    FirebaseFirestore.instance
        .collection(FBUserConsts.collUsers)
        .doc(userID)
        .get()
        .then((value) {
      final user = User.fromJson(value.data()!);

      final formattedPhone = user.phone == '' ? '' : user.phone.substring(3);

      emit(
        state.copyWith(
          name: RequiredTextInput.dirty(user.name),
          email: Email.dirty(user.email),
          phone: Phone.dirty(formattedPhone),
          initialFieldsRendered: true,
        ),
      );
    });
  }

  void setUpdateMandatoryFields(String userID) {
    final user = User(
      name: state.name.value,
      phone: '+91${state.phone.value}',
      email: state.email.value,
    );
    FirebaseFirestore.instance
        .collection(FBUserConsts.collUsers)
        .doc(userID)
        .set(user.toJson(), SetOptions(merge: true))
        .then((value) {
      emit(DataFilledActionState());
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

  void clinicPhoneChanged(String value) {
    final clinicPhone = Phone.dirty(value);
    emit(
      state.copyWith(
        phone: clinicPhone,
      ),
    );
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
        .collection(FBUserConsts.collUsers)
        .doc(userID)
        .get();

    final data = snapshot.data() as Map<String, dynamic>?;
    final hasEmail = data!.containsKey(FBUserConsts.fieldEmail) &&
        data[FBUserConsts.fieldEmail] != null;
    final hasPhoneNo = data.containsKey(FBUserConsts.fieldPhone) &&
        data[FBUserConsts.fieldPhone] != null;

    final hasName = data.containsKey(FBUserConsts.fieldName) &&
        data[FBUserConsts.fieldName] != null;

    emit(
      state.copyWith(
        hasEmail: hasEmail,
        hasPhoneNo: hasPhoneNo,
        hasName: hasName,
      ),
    );
  }
}
