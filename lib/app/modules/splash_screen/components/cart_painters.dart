// lib/core/components/cart_painters.dart

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';
import 'dart:math' as math;

import '../../../core/styles/app_colors.dart';

// 1. CartTrackPainter: Desenha a trilha do carrinho
class CartTrackPainter extends CustomPainter {
  final Color color;

  CartTrackPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(10, 10)
      ..lineTo(30, 10)
      ..lineTo(35, 30)
      ..lineTo(140, 30)
      ..lineTo(130, 70)
      ..lineTo(50, 70)
      ..lineTo(55, 90)
      ..lineTo(140, 90);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CartTrackPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

// 2. CartLinesPainter: Desenha as linhas do carrinho com opacidade
class CartLinesPainter extends CustomPainter {
  final Color color;

  CartLinesPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    Path path = Path()
      ..moveTo(10, 10)
      ..lineTo(30, 10)
      ..lineTo(35, 30)
      ..lineTo(140, 30)
      ..lineTo(130, 70)
      ..lineTo(50, 70)
      ..lineTo(55, 90)
      ..lineTo(140, 90);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CartLinesPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

// 3. CartTopPainter: Simula o efeito de desenho da trilha
class CartTopPainter extends CustomPainter {
  final double strokeDashOffset;
  final Color color;

  CartTopPainter({required this.strokeDashOffset, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..moveTo(10, 10)
      ..lineTo(30, 10)
      ..lineTo(35, 30)
      ..lineTo(140, 30)
      ..lineTo(130, 70)
      ..lineTo(50, 70)
      ..lineTo(55, 90)
      ..lineTo(140, 90);

    // Aplicar o dash offset
    Path dashedPath = dashPath(
      path,
      dashArray: CircularIntervalList<double>([338.0, 338.0]),
      dashOffset: DashOffset.absolute(strokeDashOffset),
    );
    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CartTopPainter oldDelegate) {
    return oldDelegate.strokeDashOffset != strokeDashOffset ||
        oldDelegate.color != color;
  }
}

// 4. CartWheelPainter: Desenha as rodas do carrinho
class CartWheelPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.lightOrange
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 15, paint);
  }

  @override
  bool shouldRepaint(covariant CartWheelPainter oldDelegate) => false;
}

// 5. CartWheelStrokePainter: Simula o efeito de rotação das rodas
class CartWheelStrokePainter extends CustomPainter {
  final double strokeDashOffset;
  final Color color;

  CartWheelStrokePainter({
    required this.strokeDashOffset,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path()
      ..addOval(Rect.fromCircle(center: Offset(15, 15), radius: 15));

    // dashArray: [dashLength, gapLength]
    Path dashedPath = dashPath(
      path,
      dashArray: CircularIntervalList<double>([30.0, 64.25]),
      dashOffset: DashOffset.absolute(strokeDashOffset),
    );

    canvas.drawPath(dashedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CartWheelStrokePainter oldDelegate) {
    return oldDelegate.strokeDashOffset != strokeDashOffset ||
        oldDelegate.color != color;
  }
}
