import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/repository/audio/audio_repository.dart';
import 'package:flutter_hackathon_2023/repository/audio/audio_repository_impl.dart';
import 'package:flutter_hackathon_2023/repository/post/post_repository.dart';
import 'package:flutter_hackathon_2023/repository/post/post_repository_impl.dart';
import 'package:flutter_hackathon_2023/repository/user/user_repository.dart';
import 'package:flutter_hackathon_2023/repository/user/user_repository_impl.dart';
import 'package:flutter_hackathon_2023/repository/user_id/user_id_repository.dart';
import 'package:flutter_hackathon_2023/repository/user_id/user_id_repository_impl.dart';
import 'package:flutter_hackathon_2023/service/audio_post/audio_post_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final audioPostServiceProvider = Provider<AudioPostService>(
  (ref) => AudioPostServiceImpl(
    ref.watch(audioRepositoryProvider),
    ref.watch(postRepositoryProvider),
    ref.watch(userRepositoryProvider),
    ref.watch(userIdRepositoryProvider),
  ),
);

class AudioPostServiceImpl implements AudioPostService {
  const AudioPostServiceImpl(
    this._audioRepository,
    this._postRepository,
    this._userRepository,
    this._userIdRepository,
  );

  final AudioRepository _audioRepository;
  final PostRepository _postRepository;
  final UserRepository _userRepository;
  final UserIdRepository _userIdRepository;

  @override
  Future<PostModel> upload({
    required String localFilePath,
  }) async {
    final userId = await _userIdRepository.get();

    final audioUrl = await _audioRepository.upload(
      userId: userId!,
      localFilePath: localFilePath,
    );

    final user = await _userRepository.findById(userId);

    return await _postRepository.create(
      name: user.name,
      audioUrl: audioUrl,
      imageUrl: user.imageUrl,
      userId: user.id,
    );
  }
}
