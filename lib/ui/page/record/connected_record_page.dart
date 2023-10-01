import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/state/audio_post/upload_audio_post.dart';
import 'package:flutter_hackathon_2023/ui/page/app_background_container.dart';
import 'package:flutter_hackathon_2023/ui/page/record/record_page.dart';
import 'package:flutter_hackathon_2023/ui/page/upload_completed/upload_completed_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConnectedRecordPage extends HookConsumerWidget {
  const ConnectedRecordPage({super.key});

  static const routePath = '/record';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadAudioPost = ref.watch(uploadAudioPostStateProvider);
    final loading = useState(false);

    uploadAudioPost.when(
      data: (v) {
        loading.value = false;
        const snackBar = SnackBar(
          content: Text('アップロードしました'),
        );
        if (v != null) {
          Future.microtask(
              () => ScaffoldMessenger.of(context).showSnackBar(snackBar));

          Future.microtask(() {
            context.replace(
              UploadCompletedPage.routePath,
              extra: v.toJson(),
            );
          });
        }
      },
      error: (e, s) {
        loading.value = false;
        const snackBar = SnackBar(
          content: Text('アップロードに失敗しました'),
        );
        Future.microtask(
            () => ScaffoldMessenger.of(context).showSnackBar(snackBar));
      },
      loading: () {
        loading.value = true;
      },
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: AppBackgroundContainer(
        colors: const [
          Colors.purple,
          Colors.orange,
        ],
        child: Stack(
          alignment: Alignment.center,
          children: [
            RecordPage(
              onUploadPressed: (path) {
                if (path == null) {
                  return;
                }
                ref.read(uploadAudioPostStateProvider.notifier).upload(
                      localFilePath: path,
                    );
              },
            ),
            if (loading.value) const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
