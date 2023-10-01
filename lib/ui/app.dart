import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/router/go_router.dart';
import 'package:flutter_hackathon_2023/ui/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends HookConsumerWidget {
  const App({
    super.key,
    required this.userId,
  });

  final int? userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: appTheme,
      routerConfig: createGoRouter(userId),
    );
  }
}
