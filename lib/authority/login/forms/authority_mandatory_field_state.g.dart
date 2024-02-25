// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authority_mandatory_field_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AuthorityMandatoryFieldStateCWProxy {
  AuthorityMandatoryFieldState name(RequiredTextInput name);

  AuthorityMandatoryFieldState email(Email email);

  AuthorityMandatoryFieldState phone(Phone phone);

  AuthorityMandatoryFieldState initialFieldsRendered(
      bool initialFieldsRendered);

  AuthorityMandatoryFieldState committee(Field committee);

  AuthorityMandatoryFieldState hasEmail(bool hasEmail);

  AuthorityMandatoryFieldState hasPhoneNo(bool hasPhoneNo);

  AuthorityMandatoryFieldState hasName(bool hasName);

  AuthorityMandatoryFieldState hasRole(bool hasRole);

  AuthorityMandatoryFieldState role(Role role);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthorityMandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthorityMandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthorityMandatoryFieldState call({
    RequiredTextInput? name,
    Email? email,
    Phone? phone,
    bool? initialFieldsRendered,
    Field? committee,
    bool? hasEmail,
    bool? hasPhoneNo,
    bool? hasName,
    bool? hasRole,
    Role? role,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAuthorityMandatoryFieldState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAuthorityMandatoryFieldState.copyWith.fieldName(...)`
class _$AuthorityMandatoryFieldStateCWProxyImpl
    implements _$AuthorityMandatoryFieldStateCWProxy {
  const _$AuthorityMandatoryFieldStateCWProxyImpl(this._value);

  final AuthorityMandatoryFieldState _value;

  @override
  AuthorityMandatoryFieldState name(RequiredTextInput name) => this(name: name);

  @override
  AuthorityMandatoryFieldState email(Email email) => this(email: email);

  @override
  AuthorityMandatoryFieldState phone(Phone phone) => this(phone: phone);

  @override
  AuthorityMandatoryFieldState initialFieldsRendered(
          bool initialFieldsRendered) =>
      this(initialFieldsRendered: initialFieldsRendered);

  @override
  AuthorityMandatoryFieldState committee(Field committee) =>
      this(committee: committee);

  @override
  AuthorityMandatoryFieldState hasEmail(bool hasEmail) =>
      this(hasEmail: hasEmail);

  @override
  AuthorityMandatoryFieldState hasPhoneNo(bool hasPhoneNo) =>
      this(hasPhoneNo: hasPhoneNo);

  @override
  AuthorityMandatoryFieldState hasName(bool hasName) => this(hasName: hasName);

  @override
  AuthorityMandatoryFieldState hasRole(bool hasRole) => this(hasRole: hasRole);

  @override
  AuthorityMandatoryFieldState role(Role role) => this(role: role);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AuthorityMandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AuthorityMandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  AuthorityMandatoryFieldState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phone = const $CopyWithPlaceholder(),
    Object? initialFieldsRendered = const $CopyWithPlaceholder(),
    Object? committee = const $CopyWithPlaceholder(),
    Object? hasEmail = const $CopyWithPlaceholder(),
    Object? hasPhoneNo = const $CopyWithPlaceholder(),
    Object? hasName = const $CopyWithPlaceholder(),
    Object? hasRole = const $CopyWithPlaceholder(),
    Object? role = const $CopyWithPlaceholder(),
  }) {
    return AuthorityMandatoryFieldState(
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
      committee: committee == const $CopyWithPlaceholder() || committee == null
          ? _value.committee
          // ignore: cast_nullable_to_non_nullable
          : committee as Field,
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
      hasRole: hasRole == const $CopyWithPlaceholder() || hasRole == null
          ? _value.hasRole
          // ignore: cast_nullable_to_non_nullable
          : hasRole as bool,
      role: role == const $CopyWithPlaceholder() || role == null
          ? _value.role
          // ignore: cast_nullable_to_non_nullable
          : role as Role,
    );
  }
}

extension $AuthorityMandatoryFieldStateCopyWith
    on AuthorityMandatoryFieldState {
  /// Returns a callable class that can be used as follows: `instanceOfAuthorityMandatoryFieldState.copyWith(...)` or like so:`instanceOfAuthorityMandatoryFieldState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AuthorityMandatoryFieldStateCWProxy get copyWith =>
      _$AuthorityMandatoryFieldStateCWProxyImpl(this);
}
