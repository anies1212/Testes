import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/theme/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInPageParams {
  final String userName;
  final int userId;

  SignInPageParams({
    required this.userName,
    required this.userId,
  });
}

class SignInPage extends HookConsumerWidget {
  const SignInPage({
    required this.param,
    super.key,
  });

  final SignInPageParams param;

  static const routePath = '/sign-in';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'This is Our Sign In Page\n ${param.userName}, ${param.userId}',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
