import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel extends Equatable {
  final int userId; // json 栏位名称
  final int id; // json 栏位名称
  final String title; // json 栏位名称
  final String body; // json 栏位名称
  PostModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body}); // required 里面也要改成
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  // 这里的 PostModel.fromJson 的 PostModel 也要改动，后面的 _$PostModelFromJson 的 PostModelFromJson 也要改动
  // 变成 XXX.fromJson _$XXXFromJson
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
  // 这里的 _$PostModelToJson(this) 的 PostModel 也要改动，变成_$XXXToJson(this)
  @override
  String toString() => "$userId $id $title $body";

  @override
  List<Object?> get props => [userId, id, title, body];
}
