import 'package:flutter/material.dart';
import 'package:flutter_hackathon_2023/model/post.dart';

class TimelineCarouselItem extends StatelessWidget {
  const TimelineCarouselItem({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Image.network(
            post.jacketUrl,
            height: 100,
            width: 100,
          ),
        ),
        Text(post.title),
      ],
    );
  }
}
