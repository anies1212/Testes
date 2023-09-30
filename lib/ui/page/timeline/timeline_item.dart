import 'package:audioplayers/audioplayers.dart';
import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/foundation/audio_player/audio_player.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
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
    final audioPlayer = useAudioPlayer();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${post.createdAt.month}, ${post.createdAt.weekday} ${post.createdAt.day} | 00:11',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w200,
                  fontSize: 24,
                ),
              ),
              Text(
                post.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 28,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            audioPlayer.play(UrlSource(post.audioUrl));
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
                  'https://cdn.pixabay.com/photo/2013/07/18/15/07/hummingbird-164632__340.jpg',
                  fit: BoxFit.cover,
                ),
              ),
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
              )
            ],
          ),
        ),
      ],
    );
  }
}
