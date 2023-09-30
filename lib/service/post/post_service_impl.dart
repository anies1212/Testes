import 'package:built_collection/built_collection.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/repository/post/post_repository.dart';
import 'package:flutter_hackathon_2023/repository/post/post_repository_impl.dart';
import 'package:flutter_hackathon_2023/service/post/post_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riverpod;

final postServiceProvider = riverpod.Provider<PostService>(
  (ref) => PostServiceImpl(ref.watch(postRepositoryProvider)),
);

class PostServiceImpl implements PostService {
  const PostServiceImpl(this._repository);

  final PostRepository _repository;

  @override
  Stream<BuiltList<PostModel>> watchPosts() {
    return _repository.watchAll();
  }
}
