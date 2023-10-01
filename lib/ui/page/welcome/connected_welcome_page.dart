import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/state/user/create_user_state.dart';
import 'package:flutter_hackathon_2023/ui/page/app_background_container.dart';
import 'package:flutter_hackathon_2023/ui/page/welcome/welcome_page.dart';
import 'package:flutter_hackathon_2023/ui/widget/loading/loading.dart';
import 'package:flutter_hackathon_2023/ui/widget/snackbar/snackbar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectedWelcomePage extends HookConsumerWidget {
  const ConnectedWelcomePage({super.key});

  static const routePath = '/welcome';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createUser = ref.watch(createUserProvider);
    final loading = useState(false);

    createUser.when(
      data: (v) {
        if (v == null) {
          return;
        }
        loading.value = false;

        Future.microtask(() {
          showSnackBar(context: context, text: 'Welcome');
          context.push('/timeline');
        });
      },
      error: (e, s) {
        loading.value = false;

        Future.microtask(() {
          showSnackBar(context: context, text: e.toString());
        });
      },
      loading: () {
        loading.value = true;
      },
    );
    return Scaffold(
      body: AppBackgroundContainer(
        colors: const [
          Colors.purple,
          Colors.orange,
        ],
        child: AppLoading(
          loading: loading.value,
          child: const WelcomePage(),
        ),
      ),
    );
  }
}
