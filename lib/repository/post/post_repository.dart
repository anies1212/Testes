import 'package:flutter_hackathon_2023/model/post.dart';

abstract class PostRepository {
  Stream<List<PostModel>> watchAll();
}
