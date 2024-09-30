import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleBorderContainerWidget extends StatelessWidget {

  final double progress;
  final Color color;

  const CircleBorderContainerWidget({super.key, required this.progress, this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _CirclBorderContainerPaint(progress: progress,color: color),
      child: const SizedBox.expand(),
    );
  }
}

class _CirclBorderContainerPaint extends CustomPainter {

  final double progress;
  final Color color;

  _CirclBorderContainerPaint({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke; //선 스타일 (채우기 없음)

    // 사각형 경계 정의 (원의 외곽을 감쌀 사각형)
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    // 시작 각도 (라디안 단위로 설정, 0은 3시 방향)
    final double startAngle = -pi / 2; // -90도, 즉 12시 방향에서 시작
    // 주어진 값에 따라 끝나는 각도 계산
    final double sweepAngle = 2 * pi * progress; // 주어진 값에 따라 각도를 조정 (0~2π)

    // 원호 그리기
    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false, // true면 채워진 원호, false면 선
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
