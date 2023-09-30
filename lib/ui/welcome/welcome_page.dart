import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/gen/assets.gen.dart';
import 'package:flutter_hackathon_2023/ui/sign_in/sign_in_page.dart';
import 'package:flutter_hackathon_2023/ui/theme/app_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  static const routePath = '/welcome';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Welcome to Our App',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Colors.red,
              ),
            ),
            const Gap(20),
            SvgPicture.asset(
              Assets.lib.assets.image.deathNoteL,
              height: 500,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.goNamed(
          SignInPage.routePath,
          extra: SignInPageParams(userName: 'Seina', userId: 12345),
        ),
      ),
    );
  }
}
