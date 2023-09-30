import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/foundation/record/record_controller.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_effect_once.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../timeline/timeline_item.dart';

class RecordPage extends HookConsumerWidget {
  const RecordPage({
    super.key,
    required this.onUploadPressed,
  });

  final ValueChanged<String?> onUploadPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useRecordController();
    final pathState = useState<String?>(null);
    final isRecording = useState(false);
    final durationStr = useState('00.00');
    final stopWatch = StopWatchTimer(onChange: (sec) {
      durationStr.value = StopWatchTimer.getDisplayTime(
        sec,
        second: true,
        hours: false,
        minute: false,
      );
    });

    // ignore: body_might_complete_normally_nullable
    useEffectOnce(() {
      controller.addListener(() {
        isRecording.value = controller.value.isRecording;
        isRecording.value ? stopWatch.onStartTimer() : stopWatch.onStopTimer();
      });
      return () => controller.dispose();
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: TimelineItem(post: PostModel.defaultInstance),
        ),
        const Spacer(),
        Text(
          durationStr.value.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            fontSize: 100,
          ),
        ),
        const Spacer(),
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.pink,
          ),
          child: IconButton(
            color: Colors.pink,
            iconSize: 100,
            alignment: Alignment.center,
            onPressed: () async {
              if (isRecording.value) {
                final path = await controller.stopRecording();
                pathState.value = path;
              } else {
                await controller.startRecording();
              }
            },
            icon: Icon(
              isRecording.value ? Icons.stop : Icons.mic,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),
        const Gap(16),
        OutlinedButton(
          onPressed: () => onUploadPressed(pathState.value),
          child: const Text('アップロード'),
        ),
        const Gap(16),
      ],
    );
  }
}
