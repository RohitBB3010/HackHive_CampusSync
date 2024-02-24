import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.name,
    required this.phone,
    required this.email,
    this.filePath,
    this.imageUrl,
    this.isVerified = false,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @JsonKey(defaultValue: '')
  final String name;
  @JsonKey(defaultValue: '')
  final String phone;
  @JsonKey(defaultValue: '')
  final String email;
  @JsonKey(defaultValue: '')
  final String? imageUrl;
  @JsonKey(defaultValue: '')
  final String? filePath;
  final bool isVerified;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
