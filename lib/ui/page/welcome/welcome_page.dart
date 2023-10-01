import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/gen/assets.gen.dart';
import 'package:flutter_hackathon_2023/state/user/create_user_state.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomePage extends HookConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();

    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.4,
            child: Assets.icon.iosIcon1024.image(
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Text(
                  'Ah, Ah, Testing... Testing...',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const Gap(12),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your Name',
                  ),
                  controller: textEditingController,
                  maxLength: 20,
                ),
                const Gap(12),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Colors.purple,
                      ),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      ref
                          .read(createUserProvider.notifier)
                          .createUser(textEditingController.text);
                    },
                    child: const Text('Start your Testing'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
