import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@JsonSerializable()
class Student {
  Student({
    required this.studentName,
    required this.phone,
    required this.email,
    this.filePath,
    this.imageUrl,
    this.isVerified = false,
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  @JsonKey(defaultValue: '')
  final String studentName;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String? imageUrl;
  @JsonKey(defaultValue: '')
  final String? filePath;
  final bool isVerified;

  Map<String, dynamic> toJson() => _$StudentToJson(this);
}
