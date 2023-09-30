import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/foundation/record/record_controller.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_effect_once.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RecordPage extends HookConsumerWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useRecordController();
    final pathState = useState<String?>(null);
    final isRecording = useState(false);

    // ignore: body_might_complete_normally_nullable
    useEffectOnce(() {
      controller.addListener(() {
        isRecording.value = controller.value.isRecording;
      });

      return () => controller.dispose();
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('保存パス: ${pathState.value}'),
        Row(
          children: [
            const Text(
              '録音中',
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isRecording.value ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: controller.startRecording,
          icon: const Icon(Icons.play_arrow),
        ),
        IconButton(
          onPressed: () async {
            final path = await controller.stopRecording();
            pathState.value = path;
          },
          icon: const Icon(Icons.stop),
        ),
      ],
    );
  }
}
