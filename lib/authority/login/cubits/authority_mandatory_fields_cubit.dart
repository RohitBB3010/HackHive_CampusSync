import 'package:bloc/bloc.dart';
import 'package:campus_sync/authority/login/forms/authority_mandatory_field_state.dart';
import 'package:campus_sync/consts/fb_const.dart';
import 'package:campus_sync/form_fields.dart';
import 'package:campus_sync/student/login/forms/student_mandatory_field_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:campus_sync/student/login/models/user.dart';

class AuthorityMandatoryFieldsCubit
    extends Cubit<AuthorityMandatoryFieldState> {
  AuthorityMandatoryFieldsCubit() : super(AuthorityMandatoryFieldState());

  bool initialDataRendered = false;

  void fetchMandatoryFieldsData(String userID) {
    FirebaseFirestore.instance
        .collection(FBAuthorityConsts.collAuthority)
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
        .collection(FBAuthorityConsts.collAuthority)
        .doc(userID)
        .set(user.toJson(), SetOptions(merge: true))
        .then((value) {
      emit(AuthorityDataFilledActionState());
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

  void phoneChanged(String value) {
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

  void roleChanged(String value) {
    final role = Role.dirty(value);
    emit(
      state.copyWith(
        role: role,
      ),
    );
  }

  Future<void> checkDetailsFilled(String userID) async {
    // Checks if details such as email, phone and name are filled

    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection(FBAuthorityConsts.collAuthority)
        .doc(userID)
        .get();

    final data = snapshot.data() as Map<String, dynamic>?;
    final hasEmail = data!.containsKey(FBAuthorityConsts.fieldEmail) &&
        data[FBAuthorityConsts.fieldEmail] != null;
    final hasPhoneNo = data.containsKey(FBAuthorityConsts.fieldPhone) &&
        data[FBAuthorityConsts.fieldPhone] != null;

    final hasName = data.containsKey(FBAuthorityConsts.fieldName) &&
        data[FBAuthorityConsts.fieldName] != null;

    emit(
      state.copyWith(
        hasEmail: hasEmail,
        hasPhoneNo: hasPhoneNo,
        hasName: hasName,
      ),
    );
  }
}
