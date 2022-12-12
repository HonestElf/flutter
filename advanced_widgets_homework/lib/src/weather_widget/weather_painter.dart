import 'package:advanced_widgets_homework/src/weather_widget/utils.dart';
import 'package:flutter/material.dart';

class CustomWeatherPainter extends CustomPainter {
  double weatherCondition;

  CustomWeatherPainter({required this.weatherCondition});

  @override
  void paint(Canvas canvas, Size size) {
    double canvasHeight = size.height;
    double canvasWidth = size.width;

    final sunPainter = Paint()
      ..color = Colors.yellow.withOpacity(getSunOpacity(weatherCondition))
      ..style = PaintingStyle.fill;

    Offset sunCenter = Offset(canvasHeight / 2 + 10, canvasWidth / 2);

    canvas.drawCircle(sunCenter, (canvasHeight * 0.6) / 2, sunPainter);

    final cloudPainter = Paint()
      ..color = Colors.black.withOpacity(getCloudOpacity(weatherCondition))
      ..style = PaintingStyle.fill;

    var cloud = Path()
      ..moveTo(20, canvasHeight - 20)
      ..quadraticBezierTo(-10, canvasHeight - 30, 10, canvasHeight - 40)
      ..lineTo(20, canvasHeight - 40)
      ..quadraticBezierTo(40, canvasHeight - 60, 60, canvasHeight - 40)
      ..lineTo(70, canvasHeight - 40)
      ..quadraticBezierTo(
          canvasWidth + 10, canvasHeight - 30, 70, canvasHeight - 20)
      ..close();

    canvas.drawPath(cloud, cloudPainter);

    final rainDropsPainter = Paint()
      ..color = Colors.blue.withOpacity(getDropsOpacity(weatherCondition))
      ..style = PaintingStyle.fill;

    var rainDrop1 = Path()
      ..moveTo(20, canvasHeight - 15)
      ..lineTo(15, canvasHeight - 5)
      ..quadraticBezierTo(20, canvasHeight + 5, 25, canvasHeight - 5)
      ..close();

    var rainDrop2 = Path()
      ..moveTo((canvasWidth / 2), canvasHeight - 15)
      ..lineTo(canvasWidth / 2 - 5, canvasHeight - 5)
      ..quadraticBezierTo((canvasWidth / 2), canvasHeight + 5,
          canvasWidth / 2 + 5, canvasHeight - 5)
      ..close();

    var rainDrop3 = Path()
      ..moveTo(canvasWidth - 20, canvasHeight - 15)
      ..lineTo(canvasWidth - 15, canvasHeight - 5)
      ..quadraticBezierTo(canvasWidth - 20, canvasHeight + 5, canvasWidth - 25,
          canvasHeight - 5)
      ..close();

    canvas.drawPath(rainDrop1, rainDropsPainter);
    canvas.drawPath(rainDrop2, rainDropsPainter);
    canvas.drawPath(rainDrop3, rainDropsPainter);
  }

  @override
  bool shouldRepaint(covariant CustomWeatherPainter oldDelegate) => true;
}
