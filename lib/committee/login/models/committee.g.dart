// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Committee _$CommitteeFromJson(Map<String, dynamic> json) => Committee(
      committeeName: json['committeeName'] as String?,
      committeeEmail: json['committeeEmail'] as String?,
      convener: json['convener'] as String?,
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CommitteeToJson(Committee instance) => <String, dynamic>{
      'committeeName': instance.committeeName,
      'committeeEmail': instance.committeeEmail,
      'convener': instance.convener,
      'members': instance.members,
    };
