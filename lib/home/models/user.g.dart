// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      name: json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      filePath: json['filePath'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'filePath': instance.filePath,
      'isVerified': instance.isVerified,
    };
