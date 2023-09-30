import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/foundation/record/record_controller.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_effect_once.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final size = MediaQuery.of(context).size;
    final stopWatch = StopWatchTimer(onChange: (sec) {
      durationStr.value = StopWatchTimer.getDisplayTime(
        sec,
        second: true,
        hours: false,
        minute: false,
        milliSecond: false,
      );
    });
    final isLocked = useState(false);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 5000),
    );
    final progressState = useState<double>(0);

    // ignore: body_might_complete_normally_nullable
    useEffectOnce(() {
      controller.addListener(() {
        isRecording.value = controller.value.isRecording;
        isRecording.value ? stopWatch.onStartTimer() : stopWatch.onStopTimer();
      });
      return () => controller.dispose();
    });

    // ignore: body_might_complete_normally_nullable
    useEffectOnce(() {
      animationController.addListener(() {
        progressState.value = animationController.value;
      });
      return () => animationController.dispose();
    });

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TimelineItem(post: PostModel.defaultInstance),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  durationStr.value.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 100,
                  ),
                ),
                SizedBox(
                  width: size.width / 1.1,
                  height: size.width / 1.1,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    value: progressState.value,
                    strokeWidth: 10,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: _RecordButton(
                  isRecording: isRecording,
                  isLocked: isLocked,
                  onPressed: () async {
                    if (isRecording.value) {
                      isLocked.value = true;
                      final path = await controller.stopRecording();
                      animationController.stop();
                      pathState.value = path;
                    } else {
                      if (!isLocked.value) {
                        await controller.startRecording();
                        await animationController.forward();
                      }
                    }
                  },
                  icon: Icon(
                    isRecording.value ? Icons.stop : Icons.mic,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                child: _UploadButton(
                  isRecording: isRecording,
                  isLocked: isLocked,
                  onPressed: () => onUploadPressed(pathState.value),
                  icon: const Icon(
                    Icons.upload,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _RecordButton extends HookConsumerWidget {
  const _RecordButton({
    required this.isRecording,
    required this.isLocked,
    required this.onPressed,
    required this.icon,
  });

  final ValueNotifier<bool> isRecording;
  final ValueNotifier<bool> isLocked;
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isLocked.value ? Colors.grey : Colors.pink,
      ),
      child: IconButton(
        iconSize: 100,
        alignment: Alignment.center,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}

class _UploadButton extends HookConsumerWidget {
  const _UploadButton({
    required this.isRecording,
    required this.isLocked,
    required this.onPressed,
    required this.icon,
  });

  final ValueNotifier<bool> isRecording;
  final ValueNotifier<bool> isLocked;
  final VoidCallback onPressed;
  final Icon icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: !isLocked.value ? Colors.grey : Colors.pink,
      ),
      child: IconButton(
        iconSize: 100,
        alignment: Alignment.center,
        onPressed: onPressed,
        icon: icon,
      ),
    );
  }
}
