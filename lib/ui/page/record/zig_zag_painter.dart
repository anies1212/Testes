import 'package:flutter/material.dart';

class ZigZagPainter extends CustomPainter {
  ZigZagPainter(this.amplitude);

  final double amplitude;

  @override
  void paint(Canvas canvas, Size size) {
    final animation = amplitude * -1 * 20;
    final isNotRunning = animation == 0;

    Paint paint = Paint()
      ..color = Colors.yellow.shade200
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    paintZigZag(
      canvas: canvas,
      paint: paint,
      start: isNotRunning ? Offset.zero : Offset(-20, size.height + animation),
      end: isNotRunning ? Offset.zero : Offset(size.width + 20, size.height),
      zigs: 20,
      width: 100,
    );

    paintZigZag(
      canvas: canvas,
      paint: paint,
      start: isNotRunning
          ? Offset.zero
          : Offset(-20, size.height - 100 + animation),
      end: isNotRunning
          ? Offset.zero
          : Offset(size.width + 20, size.height - 100),
      zigs: 12,
      width: 120,
    );

    paintZigZag(
      canvas: canvas,
      paint: paint,
      start: isNotRunning
          ? Offset.zero
          : Offset(-20, size.height - 150 + animation),
      end: isNotRunning
          ? Offset.zero
          : Offset(size.width + 20, size.height - 150 + animation),
      zigs: 15,
      width: 90,
    );
  }

  void paintZigZag({
    required Canvas canvas,
    required Paint paint,
    required Offset start,
    required Offset end,
    required int zigs,
    required double width,
  }) {
    assert(zigs.isFinite);
    assert(zigs > 0);
    canvas.save();
    canvas.translate(start.dx, start.dy);
    end = end - start;
    final double length = end.distance;
    final double spacing = length / (zigs * 2.0);
    final Path path = Path()..moveTo(0.0, 0.0);
    for (int index = 0; index < zigs; index += 1) {
      final double x = (index * 4.0 + 1.0) * spacing;
      final double y = width * ((index % 2.0) * 2.0 - 1.0);
      path.lineTo(x, y);
    }
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
