import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/ui/theme/app_theme.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimelineItem extends HookConsumerWidget {
  const TimelineItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
      ),
      child: Row(
        children: [
          const Gap(13),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: ClipOval(
              child: Image.network(
                'https://cdn.pixabay.com/photo/2013/07/18/15/07/hummingbird-164632__340.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'YOKOI',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Text(
                        '15時間前',
                        style: theme.textTheme.bodySmall,
                      ),
                      const Gap(24),
                      MaterialButton(
                        child: Icon(
                          Icons.pending,
                          color: Colors.grey.withOpacity(0.5),
                          size: 24,
                        ),
                        onPressed: () {
                          // TODO(anies1212): On next PR
                        },
                      ),
                    ],
                  ),
                  const Text(
                    'Example photo caption would go here, talk about your media asset. #design #ux #ui #form #journey #userexperience #asset @siimonfairhurst',
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
