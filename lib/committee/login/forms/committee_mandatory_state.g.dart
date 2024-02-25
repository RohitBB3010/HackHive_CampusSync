// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_mandatory_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$CommitteeMandatoryStateCWProxy {
  CommitteeMandatoryState committeeName(RequiredTextInput committeeName);

  CommitteeMandatoryState committeeEmail(Email committeeEmail);

  CommitteeMandatoryState convener(RequiredTextInput convener);

  CommitteeMandatoryState initialDataRendered(bool initialDataRendered);

  CommitteeMandatoryState hasCommitteeName(bool hasCommitteeName);

  CommitteeMandatoryState hasCommitteeEmail(bool hasCommitteeEmail);

  CommitteeMandatoryState hasConvener(bool hasConvener);

  CommitteeMandatoryState members(List<String> members);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommitteeMandatoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommitteeMandatoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommitteeMandatoryState call({
    RequiredTextInput? committeeName,
    Email? committeeEmail,
    RequiredTextInput? convener,
    bool? initialDataRendered,
    bool? hasCommitteeName,
    bool? hasCommitteeEmail,
    bool? hasConvener,
    List<String>? members,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfCommitteeMandatoryState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfCommitteeMandatoryState.copyWith.fieldName(...)`
class _$CommitteeMandatoryStateCWProxyImpl
    implements _$CommitteeMandatoryStateCWProxy {
  const _$CommitteeMandatoryStateCWProxyImpl(this._value);

  final CommitteeMandatoryState _value;

  @override
  CommitteeMandatoryState committeeName(RequiredTextInput committeeName) =>
      this(committeeName: committeeName);

  @override
  CommitteeMandatoryState committeeEmail(Email committeeEmail) =>
      this(committeeEmail: committeeEmail);

  @override
  CommitteeMandatoryState convener(RequiredTextInput convener) =>
      this(convener: convener);

  @override
  CommitteeMandatoryState initialDataRendered(bool initialDataRendered) =>
      this(initialDataRendered: initialDataRendered);

  @override
  CommitteeMandatoryState hasCommitteeName(bool hasCommitteeName) =>
      this(hasCommitteeName: hasCommitteeName);

  @override
  CommitteeMandatoryState hasCommitteeEmail(bool hasCommitteeEmail) =>
      this(hasCommitteeEmail: hasCommitteeEmail);

  @override
  CommitteeMandatoryState hasConvener(bool hasConvener) =>
      this(hasConvener: hasConvener);

  @override
  CommitteeMandatoryState members(List<String> members) =>
      this(members: members);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `CommitteeMandatoryState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// CommitteeMandatoryState(...).copyWith(id: 12, name: "My name")
  /// ````
  CommitteeMandatoryState call({
    Object? committeeName = const $CopyWithPlaceholder(),
    Object? committeeEmail = const $CopyWithPlaceholder(),
    Object? convener = const $CopyWithPlaceholder(),
    Object? initialDataRendered = const $CopyWithPlaceholder(),
    Object? hasCommitteeName = const $CopyWithPlaceholder(),
    Object? hasCommitteeEmail = const $CopyWithPlaceholder(),
    Object? hasConvener = const $CopyWithPlaceholder(),
    Object? members = const $CopyWithPlaceholder(),
  }) {
    return CommitteeMandatoryState(
      committeeName:
          committeeName == const $CopyWithPlaceholder() || committeeName == null
              ? _value.committeeName
              // ignore: cast_nullable_to_non_nullable
              : committeeName as RequiredTextInput,
      committeeEmail: committeeEmail == const $CopyWithPlaceholder() ||
              committeeEmail == null
          ? _value.committeeEmail
          // ignore: cast_nullable_to_non_nullable
          : committeeEmail as Email,
      convener: convener == const $CopyWithPlaceholder() || convener == null
          ? _value.convener
          // ignore: cast_nullable_to_non_nullable
          : convener as RequiredTextInput,
      initialDataRendered:
          initialDataRendered == const $CopyWithPlaceholder() ||
                  initialDataRendered == null
              ? _value.initialDataRendered
              // ignore: cast_nullable_to_non_nullable
              : initialDataRendered as bool,
      hasCommitteeName: hasCommitteeName == const $CopyWithPlaceholder() ||
              hasCommitteeName == null
          ? _value.hasCommitteeName
          // ignore: cast_nullable_to_non_nullable
          : hasCommitteeName as bool,
      hasCommitteeEmail: hasCommitteeEmail == const $CopyWithPlaceholder() ||
              hasCommitteeEmail == null
          ? _value.hasCommitteeEmail
          // ignore: cast_nullable_to_non_nullable
          : hasCommitteeEmail as bool,
      hasConvener:
          hasConvener == const $CopyWithPlaceholder() || hasConvener == null
              ? _value.hasConvener
              // ignore: cast_nullable_to_non_nullable
              : hasConvener as bool,
      members: members == const $CopyWithPlaceholder() || members == null
          ? _value.members
          // ignore: cast_nullable_to_non_nullable
          : members as List<String>,
    );
  }
}

extension $CommitteeMandatoryStateCopyWith on CommitteeMandatoryState {
  /// Returns a callable class that can be used as follows: `instanceOfCommitteeMandatoryState.copyWith(...)` or like so:`instanceOfCommitteeMandatoryState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$CommitteeMandatoryStateCWProxy get copyWith =>
      _$CommitteeMandatoryStateCWProxyImpl(this);
}
