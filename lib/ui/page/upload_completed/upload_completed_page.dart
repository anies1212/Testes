import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/gen/assets.gen.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_effect_once.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UploadCompletedPage extends HookConsumerWidget {
  const UploadCompletedPage({
    super.key,
    required this.post,
  });

  final PostModel post;

  static const routePath = '/upload_completed';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sum = post.accuracy + post.likeTest + post.unique;
    final avarage = (sum / 3).floor();

    return Scaffold(
      appBar: AppBar(),
      body: CustomScrollView(
        slivers: [
          const SliverGap(16),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.network(
                post.jacketUrl,
                height: 200,
                width: 200,
              ),
            ),
          ),
          const SliverGap(16),
          SliverToBoxAdapter(
            child: Text(
              post.title,
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
                  '"${post.description}"',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
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
                Assets.icon.totalScore.svg(width: 48, height: 48),
                Text(
                  '総合評価',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  '${avarage * 10}',
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
        ],
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
          width: 24,
          height: 24,
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
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
