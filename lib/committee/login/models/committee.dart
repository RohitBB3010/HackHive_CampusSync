import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Committee {
  Committee({
    required this.committeeName,
    required this.committeeConvener,
    required this.filePath,
    required this.imageUrl,
  });

  final String committeeName;
  final String committeeConvener;
  final String filePath;
  final String imageUrl;
}
