import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gen/contact.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Contact {
  final String name;
  final String email;
  final String message;

  Map<String, dynamic> toJson() => _$ContactToJson(this);

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  const Contact({
    required this.name,
    required this.email,
    required this.message,
  });
}
