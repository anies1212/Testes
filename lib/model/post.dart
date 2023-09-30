import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

@freezed
class PostModel with _$PostModel {
  const PostModel._();

  factory PostModel({
    required int id,
    required String name,
    required String imageUrl,
    required String audioUrl,
    required DateTime createdAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
