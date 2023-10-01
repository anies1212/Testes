import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_theme.dart';
import 'package:flutter_hackathon_2023/ui/page/timeline/timeline_carousel_item.dart';
import 'package:flutter_hackathon_2023/ui/theme/app_theme.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimelineCategoryCarouselSliverList extends HookConsumerWidget {
  const TimelineCategoryCarouselSliverList({
    super.key,
    required this.headerTitle,
    required this.posts,
  });

  final String headerTitle;
  final BuiltList<PostModel> posts;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              headerTitle,
              style: theme.textTheme.bodyLarge?.bold.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const Gap(8),
          SizedBox(
            height: 206,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TimelineCarouselItem(
                    post: posts[index],
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }
}
