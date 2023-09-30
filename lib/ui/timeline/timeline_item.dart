import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TimelineItem extends HookConsumerWidget {
  const TimelineItem({super.key});

  static const double _imageSquareWidth = 88;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sep, Sat 30 | 00:11',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w200,
                fontSize: 24,
              ),
            ),
            Text(
              'Track 1',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 36,
              ),
            ),
          ],
        ),
        Stack(
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
            const DecoratedIcon(
              Icons.play_arrow,
              color: Colors.white,
              size: 32,
              shadows: [
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
      ],
    );
  }
}
