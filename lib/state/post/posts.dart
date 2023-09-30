import 'package:built_collection/built_collection.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/service/post/post_service.dart';
import 'package:flutter_hackathon_2023/service/post/post_service_impl.dart';
import 'package:flutter_hackathon_2023/state/state_notifier_async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final postsStateProvider =
    StateNotifierProvider<PostsState, AsyncValue<BuiltList<PostModel>>>(
  (ref) => PostsState(
    AsyncValue.data(BuiltList<PostModel>()),
    ref.watch(postServiceProvider),
  ),
);

class PostsState extends StateNotifier<AsyncValue<BuiltList<PostModel>>>
    with StateNotifierAsyncMixin {
  PostsState(
    super.state,
    this._postService,
  ) {
    fetch();
  }

  final PostService _postService;

  Future<void> fetch() async {
    await handleAsync(() {
      return _postService.watchPosts().first;
    });
    _postService.watchPosts().listen((event) {
      state = AsyncValue.data(event);
    });
  }
}
