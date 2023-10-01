import 'package:audioplayers/audioplayers.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/foundation/audio_player/audio_player.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimelineItem extends HookConsumerWidget {
  const TimelineItem({
    super.key,
    required this.post,
  });

  final PostModel post;

  static const double _imageSquareWidth = 88;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = useState(false);

    final audioPlayer = useAudioPlayer();
    final createdAt = post.createdAt;

    useValueChanged<PlayerState, void>(audioPlayer.state, (_, __) {
      if (audioPlayer.state == PlayerState.completed) {
        loading.value = false;
      }
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${createdAt.year}.${createdAt.month}.${createdAt.day} ${createdAt.hour}:${createdAt.minute}',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 24,
                ),
              ),
              const Gap(4),
              Text(
                post.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const Gap(4),
              Text(
                post.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const Gap(8),
        GestureDetector(
          onTap: () async {
            loading.value = true;
            await audioPlayer.play(UrlSource(post.audioUrl));
            loading.value = false;
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(3, 2),
                    ),
                  ],
                ),
                width: _imageSquareWidth,
                height: _imageSquareWidth,
                child: Image.network(
                  post.jacketUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.grey.withOpacity(0.5),
                        Colors.transparent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              if (loading.value)
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
              if (!loading.value)
                DecoratedIcon(
                  audioPlayer.state == PlayerState.playing
                      ? Icons.pause_outlined
                      : Icons.play_arrow,
                  color: Colors.white,
                  size: 32,
                  shadows: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ],
    );
  }
}
