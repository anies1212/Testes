import 'package:flutter_hackathon_2023/model/post.dart';

abstract class PostService {
  Stream<List<PostModel>> watchPosts();
}
