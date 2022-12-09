import 'package:flutter/material.dart';

enum ScaleNames { normal, big }

Map<ScaleNames, double> scales = {ScaleNames.normal: 1, ScaleNames.big: 2};

class WeatherWidget extends StatefulWidget {
  double weatherCondition;
  WeatherWidget({super.key, required this.weatherCondition});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  double scaleRate = scales[ScaleNames.normal]!;

  void switchScale() {
    setState(() {
      if (scaleRate == scales[ScaleNames.normal]) {
        scaleRate = scales[ScaleNames.big]!;
      } else {
        scaleRate = scales[ScaleNames.normal]!;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scaleRate,
      alignment: Alignment.topRight,
      transformHitTests: true,
      child: GestureDetector(
        onTap: () {
          switchScale();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 80 * scaleRate,
              height: 80 * scaleRate,
              child: CustomPaint(
                painter: CustomWeatherPainter(
                    scaleRate: scaleRate,
                    weatherCondition: widget.weatherCondition),
              ),
            ),
            scaleRate == scales[ScaleNames.big]
                ? const Text('Облачно, 12 градусов')
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

class CustomWeatherPainter extends CustomPainter {
  double scaleRate;
  double weatherCondition;

  double _getSunOpacity() {
    if (weatherCondition < 0.4) {
      return 0;
    }

    return 5 / 3 * weatherCondition - 2 / 3;
  }

  double _getCloudOpacity() {
    if (weatherCondition > 0.9) {
      return 0;
    }

    return -(10 / 9) * weatherCondition + 1;
  }

  double _getDropsOpacity() {
    if (weatherCondition > 0.4) {
      return 0;
    }

    return -2.25 * weatherCondition + 1;
  }

  CustomWeatherPainter(
      {required this.scaleRate, required this.weatherCondition});

  @override
  void paint(Canvas canvas, Size size) {
    double canvasHeight = size.height;
    double canvasWidth = size.width;

    final sunPainter = Paint()
      ..color = Colors.yellow.withOpacity(_getSunOpacity())
      ..style = PaintingStyle.fill;

    Offset sunCenter =
        Offset(canvasHeight / 2 + 10 * scaleRate, canvasWidth / 2);

    canvas.drawCircle(sunCenter, (canvasHeight * 0.6) / 2, sunPainter);

    final cloudPainter = Paint()
      ..color = Colors.black.withOpacity(_getCloudOpacity())
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
      ..color = Colors.blue.withOpacity(_getDropsOpacity())
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
