import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/state/post/posts.dart';
import 'package:flutter_hackathon_2023/ui/page/app_background_container.dart';
import 'package:flutter_hackathon_2023/ui/page/timeline/timeline_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectedTimelinePage extends HookConsumerWidget {
  const ConnectedTimelinePage({super.key});

  static const routePath = 'timeline';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsStateProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: AppBackgroundContainer(
        child: TimelinePage(
          posts: posts.value ?? BuiltList(),
        ),
      ),
    );
  }
}
