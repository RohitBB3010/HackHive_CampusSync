// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_mandatory_field_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StudentMandatoryFieldStateCWProxy {
  StudentMandatoryFieldState name(RequiredTextInput name);

  StudentMandatoryFieldState email(Email email);

  StudentMandatoryFieldState phone(Phone phone);

  StudentMandatoryFieldState initialFieldsRendered(bool initialFieldsRendered);

  StudentMandatoryFieldState hasEmail(bool hasEmail);

  StudentMandatoryFieldState hasPhoneNo(bool hasPhoneNo);

  StudentMandatoryFieldState hasName(bool hasName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentMandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentMandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentMandatoryFieldState call({
    RequiredTextInput? name,
    Email? email,
    Phone? phone,
    bool? initialFieldsRendered,
    bool? hasEmail,
    bool? hasPhoneNo,
    bool? hasName,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStudentMandatoryFieldState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStudentMandatoryFieldState.copyWith.fieldName(...)`
class _$StudentMandatoryFieldStateCWProxyImpl
    implements _$StudentMandatoryFieldStateCWProxy {
  const _$StudentMandatoryFieldStateCWProxyImpl(this._value);

  final StudentMandatoryFieldState _value;

  @override
  StudentMandatoryFieldState name(RequiredTextInput name) => this(name: name);

  @override
  StudentMandatoryFieldState email(Email email) => this(email: email);

  @override
  StudentMandatoryFieldState phone(Phone phone) => this(phone: phone);

  @override
  StudentMandatoryFieldState initialFieldsRendered(
          bool initialFieldsRendered) =>
      this(initialFieldsRendered: initialFieldsRendered);

  @override
  StudentMandatoryFieldState hasEmail(bool hasEmail) =>
      this(hasEmail: hasEmail);

  @override
  StudentMandatoryFieldState hasPhoneNo(bool hasPhoneNo) =>
      this(hasPhoneNo: hasPhoneNo);

  @override
  StudentMandatoryFieldState hasName(bool hasName) => this(hasName: hasName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `StudentMandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// StudentMandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  StudentMandatoryFieldState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? initialFieldsRendered = const $CopyWithPlaceholder(),
    Object? hasEmail = const $CopyWithPlaceholder(),
    Object? hasPhoneNo = const $CopyWithPlaceholder(),
    Object? hasName = const $CopyWithPlaceholder(),
  }) {
    return StudentMandatoryFieldState(
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

extension $StudentMandatoryFieldStateCopyWith on StudentMandatoryFieldState {
  /// Returns a callable class that can be used as follows: `instanceOfStudentMandatoryFieldState.copyWith(...)` or like so:`instanceOfStudentMandatoryFieldState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StudentMandatoryFieldStateCWProxy get copyWith =>
      _$StudentMandatoryFieldStateCWProxyImpl(this);
}
