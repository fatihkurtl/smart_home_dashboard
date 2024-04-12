import 'dart:math';
import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  final double temperature;

  const TemperatureScreen({Key? key, required this.temperature}) : super(key: key);

  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: const Size(250, 250),
              painter: TemperaturePainter(temperature: widget.temperature),
            ),
            const SizedBox(height: 20),
            Text(
              '${widget.temperature.toStringAsFixed(1)} °C',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _getColorForTemperature(widget.temperature),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForTemperature(double temp) {
    if (temp < 18) {
      return Colors.blue;
    } else if (temp >= 18 && temp < 25) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}

class TemperaturePainter extends CustomPainter {
  final double temperature;

  TemperaturePainter({required this.temperature});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = _getColorForTemperature(temperature)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10.0;

    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = size.width / 2;
    final angle = pi * (5 / 4 + (3 / 2) * (temperature / 50));

    // Daire çizimi
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      pi * (5 / 4),
      pi * (3 / 2),
      false,
      paint..style = PaintingStyle.stroke,
    );

    // Dereceler
    final degreePaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1.5;

    final degreeTextPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final degreeTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    for (int i = -20; i <= 50; i += 10) {
      final degreeAngle = pi * (5 / 4 + (3 / 2) * (i / 50));
      final degreeX = centerX + (radius - 25) * cos(degreeAngle);
      final degreeY = centerY + (radius - 25) * sin(degreeAngle);

      final degreeTextSpan = TextSpan(text: '$i', style: degreeTextStyle);
      degreeTextPainter.text = degreeTextSpan;
      degreeTextPainter.layout();
      degreeTextPainter.paint(canvas, Offset(degreeX - 10, degreeY - 10));

      final lineX1 = centerX + (radius - 10) * cos(degreeAngle);
      final lineY1 = centerY + (radius - 10) * sin(degreeAngle);
      final lineX2 = centerX + (radius - 20) * cos(degreeAngle);
      final lineY2 = centerY + (radius - 20) * sin(degreeAngle);

      canvas.drawLine(Offset(lineX1, lineY1), Offset(lineX2, lineY2), degreePaint);
    }

    // İbre çizimi
    canvas.drawLine(
      Offset(centerX, centerY),
      Offset(centerX + radius * cos(angle), centerY + radius * sin(angle)),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Color _getColorForTemperature(double temp) {
    if (temp < 18) {
      return Colors.blue;
    } else if (temp >= 18 && temp < 25) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
