import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/state/user/create_user_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(12),
            TextFormField(
              onChanged: (value) {
                textEditingController.text = value;
              },
              controller: textEditingController,
              maxLength: 20,
            ),
            const Gap(12),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(createUserProvider.notifier)
                    .createUser(textEditingController.text);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
}
