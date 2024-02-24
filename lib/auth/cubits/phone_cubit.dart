import 'package:bloc/bloc.dart';
import 'package:campus_sync/auth/states/phone_state.dart';
import 'package:campus_sync/form_fields.dart';

class PhoneCubit extends Cubit<PhoneState> {
  PhoneCubit() : super(const PhoneState());

  void otpChanged(String value) {
    final otp = OTP.dirty(value);
    emit(
      state.copyWith(
        otp: otp,
      ),
    );
  }
}
