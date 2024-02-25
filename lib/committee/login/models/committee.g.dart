// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Committee _$CommitteeFromJson(Map<String, dynamic> json) => Committee(
      committeeName: json['committeeName'] as String,
      committeeConvener: json['committeeConvener'] as String,
      committeeEmail: json['committeeEmail'] as String,
      members: (json['members'] as List<dynamic>)
          .map((e) => Student.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommitteeToJson(Committee instance) => <String, dynamic>{
      'committeeName': instance.committeeName,
      'committeeConvener': instance.committeeConvener,
      'committeeEmail': instance.committeeEmail,
      'members': instance.members,
    };
