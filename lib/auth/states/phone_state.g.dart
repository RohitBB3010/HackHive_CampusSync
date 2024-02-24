// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$PhoneStateCWProxy {
  PhoneState otp(OTP otp);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhoneState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhoneState(...).copyWith(id: 12, name: "My name")
  /// ````
  PhoneState call({
    OTP? otp,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfPhoneState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfPhoneState.copyWith.fieldName(...)`
class _$PhoneStateCWProxyImpl implements _$PhoneStateCWProxy {
  const _$PhoneStateCWProxyImpl(this._value);

  final PhoneState _value;

  @override
  PhoneState otp(OTP otp) => this(otp: otp);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `PhoneState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// PhoneState(...).copyWith(id: 12, name: "My name")
  /// ````
  PhoneState call({
    Object? otp = const $CopyWithPlaceholder(),
  }) {
    return PhoneState(
      otp: otp == const $CopyWithPlaceholder() || otp == null
          ? _value.otp
          // ignore: cast_nullable_to_non_nullable
          : otp as OTP,
    );
  }
}

extension $PhoneStateCopyWith on PhoneState {
  /// Returns a callable class that can be used as follows: `instanceOfPhoneState.copyWith(...)` or like so:`instanceOfPhoneState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$PhoneStateCWProxy get copyWith => _$PhoneStateCWProxyImpl(this);
}
