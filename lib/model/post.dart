// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
class PostModel with _$PostModel {
  const PostModel._();

  factory PostModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'audio_url') required String audioUrl,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  static final defaultInstance = PostModel(
    id: 0,
    name: '',
    title: '',
    description: '',
    audioUrl: '',
    imageUrl: '',
    createdAt: DateTime.timestamp(),
  );
}
