import 'package:campus_sync/student/login/models/student.dart';
import 'package:json_annotation/json_annotation.dart';

part 'committee.g.dart';

@JsonSerializable()
class Committee {
  Committee({
    required this.committeeName,
    required this.committeeConvener,
    required this.committeeEmail,
    required this.filePath,
    required this.imageUrl,
    required this.members,
  });

  factory Committee.fromJson(Map<String, dynamic> json) =>
      _$CommitteeFromJson(json);

  final String committeeName;
  final String committeeConvener;
  final String committeeEmail;
  final String filePath;
  final String imageUrl;
  final List<Student> members;

  Map<String, dynamic> toJson() => _$CommitteeToJson(this);
}
