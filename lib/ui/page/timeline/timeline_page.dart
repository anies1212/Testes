import 'package:audioplayers/audioplayers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/foundation/audio_player/audio_player.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/page/timeline/timeline_category_carousel.dart';
import 'package:flutter_hackathon_2023/ui/page/timeline/timeline_item.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({
    super.key,
    required this.posts,
  });

  final BuiltList<PostModel> posts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uniquePosts = posts.where((post) => post.unique > 5).toBuiltList();
    final accuracyPosts =
        posts.where((post) => post.accuracy > 5).toBuiltList();
    final likeTestPosts =
        posts.where((post) => post.likeTest > 5).toBuiltList();

    return ShaderMask(
      shaderCallback: (Rect rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.purple,
            Colors.transparent,
            Colors.transparent,
            Colors.purple
          ],
          stops: [
            0.0,
            0.05,
            0.9,
            1.0
          ], // 10% purple, 80% transparent, 10% purple
        ).createShader(rect);
      },
      blendMode: BlendMode.dstOut,
      child: CustomScrollView(
        slivers: [
          const SliverGap(16),
          if (uniquePosts.isNotEmpty)
            TimelineCategoryCarouselSliverList(
              headerTitle: 'ユニークスペシャル',
              posts: uniquePosts,
            ),
          if (accuracyPosts.isNotEmpty)
            TimelineCategoryCarouselSliverList(
              headerTitle: '発音スペシャル',
              posts: accuracyPosts,
            ),
          if (likeTestPosts.isNotEmpty)
            TimelineCategoryCarouselSliverList(
              headerTitle: 'テストっぽさスペシャル',
              posts: likeTestPosts,
            ),
          SliverList(
            delegate: SliverChildListDelegate([
              for (final post in posts)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 18,
                    horizontal: 24,
                  ),
                  child: TimelineItem(
                    post: post,
                  ),
                ),
            ]),
          ),
        ],
      ),
    );
  }
}
