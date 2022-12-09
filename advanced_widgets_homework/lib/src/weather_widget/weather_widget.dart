import 'package:advanced_widgets_homework/src/theme_widget.dart';
import 'package:advanced_widgets_homework/src/weather_widget/weather_painter.dart';
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
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: AppThemeWidget.of(context).primaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
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
