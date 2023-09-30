import 'package:built_collection/built_collection.dart';
import 'package:flutter_hackathon_2023/model/post.dart';

abstract class PostService {
  Stream<BuiltList<PostModel>> watchPosts();
}
