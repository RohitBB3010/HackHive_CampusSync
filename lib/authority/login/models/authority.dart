import 'package:json_annotation/json_annotation.dart';

part 'authority.g.dart';

@JsonSerializable()
class Authority {
  Authority({
    required this.name,
    required this.phone,
    required this.email,
    this.filePath,
    this.imageUrl,
    this.isVerified = false,
    required this.role,
    required this.committee,
  });

  factory Authority.fromJson(Map<String, dynamic> json) =>
      _$AuthorityFromJson(json);

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
  @JsonKey(defaultValue: '')
  final String role;
  @JsonKey(defaultValue: '')
  final String committee;

  Map<String, dynamic> toJson() => _$AuthorityToJson(this);
}
