import 'package:json_annotation/json_annotation.dart';

part 'committee.g.dart';

@JsonSerializable()
class Committee {
  final String? committeeName;
  final String? committeeEmail;
  final String? convener;
  final List<String> members;

  factory Committee.fromJson(Map<String, dynamic> json) =>
      _$CommitteeFromJson(json);

  Committee({
    required this.committeeName,
    required this.committeeEmail,
    required this.convener,
    required this.members,
  });

  Map<String, dynamic> toJson() => _$CommitteeToJson(this);
}
