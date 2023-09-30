import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({
    super.key,
    required this.userId,
  });

  final int? userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: createGoRouter(userId),
      ),
    );
  }
}
