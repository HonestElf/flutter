import 'package:advanced_widgets_homework/src/weather_widget/utils.dart';
import 'package:flutter/material.dart';

class CustomWeatherPainter extends CustomPainter {
  double scaleRate;
  double weatherCondition;

  CustomWeatherPainter(
      {required this.weatherCondition, required this.scaleRate});

  @override
  void paint(Canvas canvas, Size size) {
    double canvasHeight = size.height;
    double canvasWidth = size.width;

    final sunPainter = Paint()
      ..color = Colors.yellow.withOpacity(getSunOpacity(weatherCondition))
      ..style = PaintingStyle.fill;

    Offset sunCenter =
        Offset(canvasHeight / 2 + 10 * scaleRate, canvasWidth / 2);

    canvas.drawCircle(sunCenter, (canvasHeight * 0.6) / 2, sunPainter);

    final cloudPainter = Paint()
      ..color = Colors.black.withOpacity(getCloudOpacity(weatherCondition))
      ..style = PaintingStyle.fill;

    var cloud = Path()
      ..moveTo(20 * scaleRate, canvasHeight - 20 * scaleRate)
      ..quadraticBezierTo(-10 * scaleRate, canvasHeight - 30 * scaleRate,
          10 * scaleRate, canvasHeight - 40 * scaleRate)
      ..lineTo(20 * scaleRate, canvasHeight - 40 * scaleRate)
      ..quadraticBezierTo(40 * scaleRate, canvasHeight - 60 * scaleRate,
          60 * scaleRate, canvasHeight - 40 * scaleRate)
      ..lineTo(70 * scaleRate, canvasHeight - 40 * scaleRate)
      ..quadraticBezierTo(
          canvasWidth + 10 * scaleRate,
          canvasHeight - 30 * scaleRate,
          70 * scaleRate,
          canvasHeight - 20 * scaleRate)
      ..close();

    canvas.drawPath(cloud, cloudPainter);

    final rainDropsPainter = Paint()
      ..color = Colors.blue.withOpacity(getDropsOpacity(weatherCondition))
      ..style = PaintingStyle.fill;

    var rainDrop1 = Path()
      ..moveTo(20 * scaleRate, canvasHeight - 15 * scaleRate)
      ..lineTo(15 * scaleRate, canvasHeight - 5 * scaleRate)
      ..quadraticBezierTo(20 * scaleRate, canvasHeight + 5 * scaleRate,
          25 * scaleRate, canvasHeight - 5 * scaleRate)
      ..close();

    var rainDrop2 = Path()
      ..moveTo((canvasWidth / 2), canvasHeight - 15 * scaleRate)
      ..lineTo(canvasWidth / 2 - 5 * scaleRate, canvasHeight - 5 * scaleRate)
      ..quadraticBezierTo((canvasWidth / 2), canvasHeight + 5 * scaleRate,
          canvasWidth / 2 + 5 * scaleRate, canvasHeight - 5 * scaleRate)
      ..close();

    var rainDrop3 = Path()
      ..moveTo(canvasWidth - 20 * scaleRate, canvasHeight - 15 * scaleRate)
      ..lineTo(canvasWidth - 15 * scaleRate, canvasHeight - 5 * scaleRate)
      ..quadraticBezierTo(
          canvasWidth - 20 * scaleRate,
          canvasHeight + 5 * scaleRate,
          canvasWidth - 25 * scaleRate,
          canvasHeight - 5 * scaleRate)
      ..close();

    canvas.drawPath(rainDrop1, rainDropsPainter);
    canvas.drawPath(rainDrop2, rainDropsPainter);
    canvas.drawPath(rainDrop3, rainDropsPainter);
  }

  @override
  bool shouldRepaint(covariant CustomWeatherPainter oldDelegate) =>
      oldDelegate.scaleRate != scaleRate;
}
