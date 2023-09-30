import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppSliderSection extends HookConsumerWidget {
  const AppSliderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderRef = useState<double>(0);

    return Column(
      children: [
        Slider(
          min: 0,
          max: 5,
          divisions: 5,
          value: sliderRef.value,
          onChanged: (value) => sliderRef.value = value,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('0:00'),
                  Text('-0:05'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _Button(
                    type: _ButtonType.pause,
                    onPressed: () {},
                  ),
                  _Button(
                    type: _ButtonType.play,
                    onPressed: () {},
                  ),
                  MaterialButton(
                    onPressed: () {},
                    child: const Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 24,
                          color: Colors.red,
                        ),
                        Text('100'),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Button extends HookConsumerWidget {
  const _Button({
    required this.type,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  final _ButtonType type;

  static const IconData _pause = IconData(0xe47c, fontFamily: 'MaterialIcons');
  static const _lightBlue = Colors.lightBlue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: Colors.white70,
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          const Icon(
            _pause,
            size: 24,
            color: _lightBlue,
          ),
          Text(
            type.title,
            style: const TextStyle(
              color: _lightBlue,
            ),
          ),
        ],
      ),
    );
  }
}

enum _ButtonType {
  play('Play'),
  pause('Pause'),
  ;

  final String title;

  const _ButtonType(this.title);
}