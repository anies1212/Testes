import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/state/audio/upload_audio.dart';
import 'package:flutter_hackathon_2023/ui/page/record/record_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectedRecordPage extends HookConsumerWidget {
  const ConnectedRecordPage({super.key});

  static const routePath = 'record';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadAudio = ref.watch(uploadAudioStateProvider);
    final loading = useState(false);

    uploadAudio.when(
      data: (v) {
        loading.value = false;
        const snackBar = SnackBar(
          content: Text('アップロードしました'),
        );
        if (v != null) {
          Future.microtask(
              () => ScaffoldMessenger.of(context).showSnackBar(snackBar));
        }
      },
      error: (e, s) {
        loading.value = false;
        const snackBar = SnackBar(
          content: Text('アップロードに失敗しました'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      loading: () {
        loading.value = true;
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Record'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          RecordPage(
            onUploadPressed: (path) {
              if (path == null) {
                return;
              }
              ref.read(uploadAudioStateProvider.notifier).upload(
                    localFilePath: path,
                  );
            },
          ),
          if (loading.value) const CircularProgressIndicator()
        ],
      ),
    );
  }
}
