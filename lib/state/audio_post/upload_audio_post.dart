import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/service/audio_post/audio_post_service.dart';
import 'package:flutter_hackathon_2023/service/audio_post/audio_post_service_impl.dart';
import 'package:flutter_hackathon_2023/state/state_notifier_async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uploadAudioPostStateProvider =
    StateNotifierProvider<UploadAudioPostState, AsyncValue<PostModel?>>(
  (ref) => UploadAudioPostState(
    const AsyncValue.data(null),
    ref.watch(audioPostServiceProvider),
  ),
);

class UploadAudioPostState extends StateNotifier<AsyncValue<PostModel?>>
    with StateNotifierAsyncMixin {
  UploadAudioPostState(
    super.state,
    this._audioPostService,
  );

  final AudioPostService _audioPostService;

  Future<void> upload({
    required String localFilePath,
  }) async {
    await handleAsync(() async {
      return await _audioPostService.upload(localFilePath: localFilePath);
    });
  }
}
