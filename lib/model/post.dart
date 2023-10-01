// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';

part 'post.g.dart';

@freezed
class PostModel with _$PostModel {
  const PostModel._();

  factory PostModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'image_url') required String imageUrl,
    @JsonKey(name: 'audio_url') required String audioUrl,
    @JsonKey(name: 'jacket_url') required String jacketUrl,
    @JsonKey(name: 'accuracy') required int accuracy,
    @JsonKey(name: 'unique') required int unique,
    @JsonKey(name: 'like_test') required int likeTest,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);

  static final defaultInstance = PostModel(
    id: 0,
    userId: 0,
    name: '',
    title: '',
    description: '',
    audioUrl: '',
    imageUrl: '',
    jacketUrl: '',
    accuracy: 0,
    unique: 0,
    likeTest: 0,
    createdAt: DateTime.timestamp(),
  );
}
