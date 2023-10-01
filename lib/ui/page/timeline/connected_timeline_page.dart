import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/state/post/posts.dart';
import 'package:flutter_hackathon_2023/ui/page/app_background_container.dart';
import 'package:flutter_hackathon_2023/ui/page/record/connected_record_page.dart';
import 'package:flutter_hackathon_2023/ui/page/timeline/timeline_page.dart';
import 'package:flutter_hackathon_2023/ui/widget/loading/loading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectedTimelinePage extends HookConsumerWidget {
  const ConnectedTimelinePage({super.key});

  static const routePath = '/timeline';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsStateProvider);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () => context.push(ConnectedRecordPage.routePath),
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            color: Colors.orange,
          ),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: AppBackgroundContainer(
        colors: const [
          Colors.orange,
          Colors.pink,
        ],
        child: AppLoading(
          loading: posts.value == null,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 48),
              child: TimelinePage(
                posts: posts.value ?? BuiltList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
