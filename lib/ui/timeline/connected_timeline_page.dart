import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/page/app_background_container.dart';
import 'package:flutter_hackathon_2023/ui/timeline/timeline_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectedTimelinePage extends HookConsumerWidget {
  const ConnectedTimelinePage({super.key});

  static const routePath = 'timeline';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: const AppBackgroundContainer(
        colors: [
          Colors.orange,
          Colors.pink,
        ],
        child: TimelinePage(),
      ),
    );
  }
}
