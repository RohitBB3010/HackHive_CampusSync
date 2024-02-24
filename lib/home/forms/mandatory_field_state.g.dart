// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mandatory_field_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MandatoryFieldStateCWProxy {
  MandatoryFieldState name(RequiredTextInput name);

  MandatoryFieldState email(Email email);

  MandatoryFieldState phone(Phone phone);

  MandatoryFieldState initialFieldsRendered(bool initialFieldsRendered);

  MandatoryFieldState hasEmail(bool hasEmail);

  MandatoryFieldState hasPhoneNo(bool hasPhoneNo);

  MandatoryFieldState hasName(bool hasName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  MandatoryFieldState call({
    RequiredTextInput? name,
    Email? email,
    Phone? phone,
    bool? initialFieldsRendered,
    bool? hasEmail,
    bool? hasPhoneNo,
    bool? hasName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfMandatoryFieldState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfMandatoryFieldState.copyWith.fieldName(...)`
class _$MandatoryFieldStateCWProxyImpl implements _$MandatoryFieldStateCWProxy {
  const _$MandatoryFieldStateCWProxyImpl(this._value);

  final MandatoryFieldState _value;

  @override
  MandatoryFieldState name(RequiredTextInput name) => this(name: name);

  @override
  MandatoryFieldState email(Email email) => this(email: email);

  @override
  MandatoryFieldState phone(Phone phone) => this(phone: phone);

  @override
  MandatoryFieldState initialFieldsRendered(bool initialFieldsRendered) =>
      this(initialFieldsRendered: initialFieldsRendered);

  @override
  MandatoryFieldState hasEmail(bool hasEmail) => this(hasEmail: hasEmail);

  @override
  MandatoryFieldState hasPhoneNo(bool hasPhoneNo) =>
      this(hasPhoneNo: hasPhoneNo);

  @override
  MandatoryFieldState hasName(bool hasName) => this(hasName: hasName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `MandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// MandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  MandatoryFieldState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? initialFieldsRendered = const $CopyWithPlaceholder(),
    Object? hasEmail = const $CopyWithPlaceholder(),
    Object? hasPhoneNo = const $CopyWithPlaceholder(),
    Object? hasName = const $CopyWithPlaceholder(),
  }) {
    return MandatoryFieldState(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as RequiredTextInput,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as Email,
      phone: phone == const $CopyWithPlaceholder() || phone == null
          ? _value.phone
          // ignore: cast_nullable_to_non_nullable
          : phone as Phone,
      initialFieldsRendered:
          initialFieldsRendered == const $CopyWithPlaceholder() ||
                  initialFieldsRendered == null
              ? _value.initialFieldsRendered
              // ignore: cast_nullable_to_non_nullable
              : initialFieldsRendered as bool,
      hasEmail: hasEmail == const $CopyWithPlaceholder() || hasEmail == null
          ? _value.hasEmail
          // ignore: cast_nullable_to_non_nullable
          : hasEmail as bool,
      hasPhoneNo:
          hasPhoneNo == const $CopyWithPlaceholder() || hasPhoneNo == null
              ? _value.hasPhoneNo
              // ignore: cast_nullable_to_non_nullable
              : hasPhoneNo as bool,
      hasName: hasName == const $CopyWithPlaceholder() || hasName == null
          ? _value.hasName
          // ignore: cast_nullable_to_non_nullable
          : hasName as bool,
    );
  }
}

extension $MandatoryFieldStateCopyWith on MandatoryFieldState {
  /// Returns a callable class that can be used as follows: `instanceOfMandatoryFieldState.copyWith(...)` or like so:`instanceOfMandatoryFieldState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MandatoryFieldStateCWProxy get copyWith =>
      _$MandatoryFieldStateCWProxyImpl(this);
}
