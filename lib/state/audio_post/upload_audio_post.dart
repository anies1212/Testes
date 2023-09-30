import 'package:flutter_hackathon_2023/foundation/unit.dart';
import 'package:flutter_hackathon_2023/service/audio/audio_service.dart';
import 'package:flutter_hackathon_2023/service/audio/audio_service_impl.dart';
import 'package:flutter_hackathon_2023/state/state_notifier_async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final uploadAudioStateProvider =
    StateNotifierProvider<UploadAudioState, AsyncValue<Unit?>>(
  (ref) => UploadAudioState(
    const AsyncValue.data(null),
    ref.watch(audioServiceProvider),
  ),
);

class UploadAudioState extends StateNotifier<AsyncValue<Unit?>>
    with StateNotifierAsyncMixin {
  UploadAudioState(
    super.state,
    this._audioService,
  );

  final AudioService _audioService;

  Future<void> upload({
    required String localFilePath,
  }) async {
    await handleAsync(() async {
      await _audioService.upload(localFilePath: localFilePath);
      return unit;
    });
  }
}
