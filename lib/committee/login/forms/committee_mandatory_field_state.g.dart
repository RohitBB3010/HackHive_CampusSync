// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_mandatory_field_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommitteeMandatoryFieldStateCWProxy {
  CommitteeMandatoryFieldState name(RequiredTextInput name);

  CommitteeMandatoryFieldState email(Email email);

  CommitteeMandatoryFieldState phone(Phone phone);

  CommitteeMandatoryFieldState initialFieldsRendered(
      bool initialFieldsRendered);

  CommitteeMandatoryFieldState hasEmail(bool hasEmail);

  CommitteeMandatoryFieldState hasPhoneNo(bool hasPhoneNo);

  CommitteeMandatoryFieldState hasName(bool hasName);

  CommitteeMandatoryFieldState role(Role role);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommitteeMandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommitteeMandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommitteeMandatoryFieldState call({
    RequiredTextInput? name,
    Email? email,
    Phone? phone,
    bool? initialFieldsRendered,
    bool? hasEmail,
    bool? hasPhoneNo,
    bool? hasName,
    Role? role,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommitteeMandatoryFieldState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCommitteeMandatoryFieldState.copyWith.fieldName(...)`
class _$CommitteeMandatoryFieldStateCWProxyImpl
    implements _$CommitteeMandatoryFieldStateCWProxy {
  const _$CommitteeMandatoryFieldStateCWProxyImpl(this._value);

  final CommitteeMandatoryFieldState _value;

  @override
  CommitteeMandatoryFieldState name(RequiredTextInput name) => this(name: name);

  @override
  CommitteeMandatoryFieldState email(Email email) => this(email: email);

  @override
  CommitteeMandatoryFieldState phone(Phone phone) => this(phone: phone);

  @override
  CommitteeMandatoryFieldState initialFieldsRendered(
          bool initialFieldsRendered) =>
      this(initialFieldsRendered: initialFieldsRendered);

  @override
  CommitteeMandatoryFieldState hasEmail(bool hasEmail) =>
      this(hasEmail: hasEmail);

  @override
  CommitteeMandatoryFieldState hasPhoneNo(bool hasPhoneNo) =>
      this(hasPhoneNo: hasPhoneNo);

  @override
  CommitteeMandatoryFieldState hasName(bool hasName) => this(hasName: hasName);

  @override
  CommitteeMandatoryFieldState role(Role role) => this(role: role);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommitteeMandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommitteeMandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommitteeMandatoryFieldState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? initialFieldsRendered = const $CopyWithPlaceholder(),
    Object? hasEmail = const $CopyWithPlaceholder(),
    Object? hasPhoneNo = const $CopyWithPlaceholder(),
    Object? hasName = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
  }) {
    return CommitteeMandatoryFieldState(
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
      role: role == const $CopyWithPlaceholder() || role == null
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as Role,
    );
  }
}

extension $CommitteeMandatoryFieldStateCopyWith
    on CommitteeMandatoryFieldState {
  /// Returns a callable class that can be used as follows: `instanceOfCommitteeMandatoryFieldState.copyWith(...)` or like so:`instanceOfCommitteeMandatoryFieldState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommitteeMandatoryFieldStateCWProxy get copyWith =>
      _$CommitteeMandatoryFieldStateCWProxyImpl(this);
}
