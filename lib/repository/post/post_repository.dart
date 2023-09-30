import 'package:built_collection/built_collection.dart';
import 'package:flutter_hackathon_2023/model/post.dart';

interface class PostRepository {
  Stream<BuiltList<PostModel>> watchAll() {
    throw UnimplementedError();
  }

  Future<PostModel> create({
    required String name,
    required String imageUrl,
    required String audioUrl,
  }) {
    throw UnimplementedError();
  }
}
