import 'package:audioplayers/audioplayers.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/foundation/audio_player/audio_player.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimelineCarouselItem extends HookConsumerWidget {
  const TimelineCarouselItem({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = useTheme();
    final audioPlayer = useAudioPlayer();
    final loading = useState(false);

    useValueChanged<PlayerState, void>(audioPlayer.state, (_, __) {
      if (audioPlayer.state == PlayerState.completed) {
        loading.value = false;
      }
    });

    return SizedBox(
      height: 160,
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              loading.value = true;
              audioPlayer.play(UrlSource(post.audioUrl));
              loading.value = false;
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
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
                          Colors.grey.withOpacity(0.8),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
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
          Text(
            post.title,
            style: theme.textTheme.displaySmall?.copyWith(
              color: Colors.white,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            post.name,
            style: theme.textTheme.bodySmall?.copyWith(
              color: Colors.white54,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
