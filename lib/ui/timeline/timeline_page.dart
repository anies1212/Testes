import 'package:flutter/cupertino.dart';
import 'package:flutter_hackathon_2023/ui/timeline/timeline_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimelinePage extends HookConsumerWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            for (int i = 0; i < 10; i++)
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 24,
                ),
                child: TimelineItem(),
              ),
          ]),
        ),
      ],
    );
  }
}
