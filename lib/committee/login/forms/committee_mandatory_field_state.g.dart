// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_mandatory_field_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommitteeMandatoryFieldStateCWProxy {
  CommitteeMandatoryFieldState name(RequiredTextInput name);

  CommitteeMandatoryFieldState convener(RequiredTextInput convener);

  CommitteeMandatoryFieldState email(Email email);

  CommitteeMandatoryFieldState initialFieldsRendered(
      bool initialFieldsRendered);

  CommitteeMandatoryFieldState hasConvener(bool hasConvener);

  CommitteeMandatoryFieldState hasEmail(bool hasEmail);

  CommitteeMandatoryFieldState hasName(bool hasName);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommitteeMandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommitteeMandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommitteeMandatoryFieldState call({
    RequiredTextInput? name,
    RequiredTextInput? convener,
    Email? email,
    bool? initialFieldsRendered,
    bool? hasConvener,
    bool? hasEmail,
    bool? hasName,
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
  CommitteeMandatoryFieldState convener(RequiredTextInput convener) =>
      this(convener: convener);

  @override
  CommitteeMandatoryFieldState email(Email email) => this(email: email);

  @override
  CommitteeMandatoryFieldState initialFieldsRendered(
          bool initialFieldsRendered) =>
      this(initialFieldsRendered: initialFieldsRendered);

  @override
  CommitteeMandatoryFieldState hasConvener(bool hasConvener) =>
      this(hasConvener: hasConvener);

  @override
  CommitteeMandatoryFieldState hasEmail(bool hasEmail) =>
      this(hasEmail: hasEmail);

  @override
  CommitteeMandatoryFieldState hasName(bool hasName) => this(hasName: hasName);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommitteeMandatoryFieldState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommitteeMandatoryFieldState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommitteeMandatoryFieldState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? convener = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? initialFieldsRendered = const $CopyWithPlaceholder(),
    Object? hasConvener = const $CopyWithPlaceholder(),
    Object? hasEmail = const $CopyWithPlaceholder(),
    Object? hasName = const $CopyWithPlaceholder(),
  }) {
    return CommitteeMandatoryFieldState(
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as RequiredTextInput,
      convener: convener == const $CopyWithPlaceholder() || convener == null
          ? _value.convener
          // ignore: cast_nullable_to_non_nullable
          : convener as RequiredTextInput,
      email: email == const $CopyWithPlaceholder() || email == null
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as Email,
      initialFieldsRendered:
          initialFieldsRendered == const $CopyWithPlaceholder() ||
                  initialFieldsRendered == null
              ? _value.initialFieldsRendered
              // ignore: cast_nullable_to_non_nullable
              : initialFieldsRendered as bool,
      hasConvener:
          hasConvener == const $CopyWithPlaceholder() || hasConvener == null
              ? _value.hasConvener
              // ignore: cast_nullable_to_non_nullable
              : hasConvener as bool,
      hasEmail: hasEmail == const $CopyWithPlaceholder() || hasEmail == null
          ? _value.hasEmail
          // ignore: cast_nullable_to_non_nullable
          : hasEmail as bool,
      hasName: hasName == const $CopyWithPlaceholder() || hasName == null
          ? _value.hasName
          // ignore: cast_nullable_to_non_nullable
          : hasName as bool,
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
