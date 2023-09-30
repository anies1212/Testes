import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/page/timeline/timeline_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({
    super.key,
    required this.posts,
  });

  final BuiltList<PostModel> posts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            for (int i = 0; i < posts.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 24,
                ),
                child: TimelineItem(
                  post: posts[i],
                ),
              ),
          ]),
        ),
      ],
    );
  }
}
