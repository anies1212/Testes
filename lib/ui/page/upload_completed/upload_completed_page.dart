import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/foundation/audio_player/audio_player.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_effect_once.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UploadCompletedPage extends HookConsumerWidget {
  const UploadCompletedPage({super.key});

  static const routePath = '/upload_completed';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPlayer = useAudioPlayer();

    return Scaffold(
      appBar: AppBar(
        title: const Text('アップロード完了'),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverGap(16),
              SliverToBoxAdapter(
                child: CachedNetworkImage(
                  fadeInDuration: Duration.zero,
                  fadeOutDuration: Duration.zero,
                  height: 200,
                  width: 200,
                  imageUrl:
                      'https://www.nogizaka46.com/files/46/news/65974_1.jpg',
                ),
              ),
              const SliverGap(16),
              SliverToBoxAdapter(
                child: Text(
                  'タイトル',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.black,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey,
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '"description"',
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontStyle: FontStyle.italic,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SliverGap(40),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Text(
                      '総合評価',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '89',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            color: Colors.black,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _IndicatorItem(
                        value: 20,
                      ),
                      const Gap(20),
                      _IndicatorItem(
                        value: 50,
                      ),
                      const Gap(20),
                      _IndicatorItem(
                        value: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.play_arrow),
            ),
          ),
        ],
      ),
    );
  }
}

class _IndicatorItem extends HookConsumerWidget {
  const _IndicatorItem({
    super.key,
    required this.value,
  });

  final int value;

  static const _height = 8.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = useState(0.0);
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );
    final animation = animationController.drive(
      Tween<double>(
        begin: 0,
        end: value.toDouble(),
      ),
    );

    useEffectOnce(() {
      Future.delayed(const Duration(milliseconds: 500), () {
        animationController.forward();
      });

      animationController.addListener(() {
        progress.value = animation.value;
      });

      return () => animationController.dispose();
    });

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.ac_unit,
          size: 32,
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('音声'),
              const Gap(4),
              Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.grey,
                      ),
                      height: _height,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: progress.value / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.red,
                      ),
                      height: _height,
                    ),
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
