// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authority.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authority _$AuthorityFromJson(Map<String, dynamic> json) => Authority(
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      filePath: json['filePath'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? false,
      role: json['role'] as String? ?? '',
      committee: json['committee'] as String? ?? '',
    );

Map<String, dynamic> _$AuthorityToJson(Authority instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'filePath': instance.filePath,
      'isVerified': instance.isVerified,
      'role': instance.role,
      'committee': instance.committee,
    };
