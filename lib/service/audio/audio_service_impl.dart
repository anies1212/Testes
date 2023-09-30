import 'package:flutter_hackathon_2023/repository/audio/audio_repository.dart';
import 'package:flutter_hackathon_2023/repository/audio/audio_repository_impl.dart';
import 'package:flutter_hackathon_2023/service/audio/audio_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioServiceProvider = Provider<AudioService>(
  (ref) => AudioServiceImpl(ref.watch(audioRepositoryProvider)),
);

class AudioServiceImpl implements AudioService {
  const AudioServiceImpl(this._repository);

  final AudioRepository _repository;

  @override
  Future<void> upload({
    required String localFilePath,
  }) async {
    // TODO: SharedPreferencesからuserIdを取得する
    const userId = 1;

    await _repository.upload(userId: userId, localFilePath: localFilePath);
  }
}
