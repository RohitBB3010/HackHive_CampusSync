// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Student _$StudentFromJson(Map<String, dynamic> json) => Student(
      studentName: json['studentName'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      filePath: json['filePath'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? false,
    );

Map<String, dynamic> _$StudentToJson(Student instance) => <String, dynamic>{
      'studentName': instance.studentName,
      'phone': instance.phone,
      'email': instance.email,
      'imageUrl': instance.imageUrl,
      'filePath': instance.filePath,
      'isVerified': instance.isVerified,
    };
