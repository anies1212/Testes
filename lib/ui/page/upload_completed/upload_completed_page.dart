import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/gen/assets.gen.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_effect_once.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_theme.dart';
import 'package:flutter_hackathon_2023/ui/page/app_background_container.dart';
import 'package:flutter_hackathon_2023/ui/theme/app_theme.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UploadCompletedPage extends HookConsumerWidget {
  const UploadCompletedPage({
    super.key,
    // required this.post,
  });

  // final PostModel post;

  static const routePath = '/upload_completed';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = PostModel(
      id: 0,
      name: '',
      title: 'よ来いよ来いタイトル',
      description: 'よ来いよ来い',
      imageUrl:
          'https://service-cdn.coconala.com/crop/460/380/service_images/original/78723bf6-5429995.png',
      audioUrl: '',
      jacketUrl:
          'https://ogre.natalie.mu/media/news/music/2023/0406/YOASOBI_jkt202304.jpg?imwidth=750&imdensity=1',
      accuracy: 6,
      unique: 5,
      likeTest: 2,
      createdAt: DateTime.now(),
    );

    final theme = useTheme();
    final sum = post.accuracy + post.likeTest + post.unique;
    final avarage = (sum / 3).floor();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
      ),
      body: AppBackgroundContainer(
        colors: const [
          Colors.orange,
          Colors.red,
        ],
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 400,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Image.network(
                    post.jacketUrl,
                    height: 400,
                    width: double.infinity,
                  ),
                ),
              ),
              const SliverGap(4),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            Text(
                              '"${post.description}"',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 80,
                        width: 80,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          post.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverGap(40),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Assets.icon.totalScore.svg(
                            width: 48,
                            height: 48,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                          const Gap(4),
                          Text(
                            '総合評価',
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.white,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                          const Gap(16),
                          Text(
                            '${avarage * 10}',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  color: Colors.white,
                                ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      _IndicatorItem(
                        title: '発声',
                        value: post.accuracy,
                      ),
                      const Gap(20),
                      _IndicatorItem(
                        title: 'テストっぽさ',
                        value: post.likeTest,
                      ),
                      const Gap(20),
                      _IndicatorItem(
                        title: 'ユニークさ',
                        value: post.unique,
                      ),
                    ],
                  ),
                ),
              ),
              const SliverGap(40),
            ],
          ),
        ),
      ),
    );
  }
}

class _IndicatorItem extends HookConsumerWidget {
  const _IndicatorItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
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
        end: value.toDouble() * 10,
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
        Assets.icon.score.svg(
          width: 28,
          height: 28,
          colorFilter: const ColorFilter.mode(
            Colors.white,
            BlendMode.srcIn,
          ),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$title：${value * 10}',
                style: Theme.of(context).textTheme.bodyMedium?.bold?.copyWith(
                      color: Colors.white,
                    ),
              ),
              const Gap(4),
              Stack(
                children: [
                  FractionallySizedBox(
                    widthFactor: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white,
                      ),
                      height: _height,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: progress.value / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.purple,
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
