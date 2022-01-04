import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override
  String toString() => "$userId $id $title $body";

  @override
  List<Object?> get props => [userId, id, title, body];
}
