import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    super.key,
    required this.loading,
    required this.child,
  });

  final bool loading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IgnorePointer(
          ignoring: loading,
          child: child,
        ),
        if (loading)
          Center(
            child: LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.black12.withOpacity(0.6),
              size: 100,
            ),
          ),
      ],
    );
  }
}
