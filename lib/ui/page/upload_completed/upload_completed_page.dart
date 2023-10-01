import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/gen/assets.gen.dart';
import 'package:flutter_hackathon_2023/model/post.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_effect_once.dart';
import 'package:flutter_hackathon_2023/ui/hook/use_theme.dart';
import 'package:flutter_hackathon_2023/ui/page/app_background_container.dart';
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

    final theme = useTheme();
    final sum = post.accuracy + post.likeTest + post.unique;
    final average = (sum / 3).floor();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        elevation: 0,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _CircularText(
                      title: 'average score',
                      isTitle: true,
                    ),
                    const Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${average * 10}',
                          style: const TextStyle(
                            fontSize: 70,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          '点',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ],
                    ),
                    const Gap(24),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white38,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              post.jacketUrl,
                              height: 60,
                              width: 60,
                            ),
                            const Gap(12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    post.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  const Gap(12),
                                  Text(
                                    post.description,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w200,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(36),
                          const _CircularText(title: 'pronunciation'),
                          const Gap(12),
                          _IndicatorItem(
                            value: post.accuracy,
                          ),
                          const Gap(24),
                          const _CircularText(title: 'testability'),
                          const Gap(12),
                          _IndicatorItem(
                            value: post.likeTest,
                          ),
                          const Gap(24),
                          const _CircularText(title: 'uniqueness'),
                          const Gap(12),
                          _IndicatorItem(
                            value: post.unique,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _IndicatorItem extends HookConsumerWidget {
  const _IndicatorItem({
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
        const Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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

class _CircularText extends HookConsumerWidget {
  const _CircularText({
    required this.title,
    this.isTitle = false,
  });

  final String title;
  final bool isTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
        color: Colors.white38,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 6,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: isTitle ? 14 : 12,
          color: Colors.white,
        ),
      ),
    );
  }
}
