import 'package:advanced_widgets_homework/src/customWidget/inner_shadow.dart';
import 'package:advanced_widgets_homework/src/theme_widget.dart';
import 'package:advanced_widgets_homework/src/weather_widget/weather_painter.dart';
import 'package:flutter/material.dart';

enum ScaleNames { normal, big }

Map<ScaleNames, double> scales = {ScaleNames.normal: 1, ScaleNames.big: 2};

class WeatherWidget extends StatefulWidget {
  final double weatherCondition;
  const WeatherWidget({super.key, required this.weatherCondition});

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
    return GestureDetector(
      onTap: () {
        switchScale();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border:
                    Border.all(color: AppThemeWidget.of(context).primaryColor),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: AnimatedSize(
              clipBehavior: Clip.hardEdge,
              duration: const Duration(seconds: 1),
              reverseDuration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              child: SizedBox(
                width: 80 * scaleRate,
                height: 80 * scaleRate,
                child: CustomPaint(
                  painter: CustomWeatherPainter(
                      scaleRate: scaleRate,
                      weatherCondition: widget.weatherCondition),
                ),
              ),
            ),
          ),
          scaleRate == scales[ScaleNames.big]
              ? InnerShadow(
                  blur: 10,
                  color: AppThemeWidget.of(context).primaryColor,
                  offset: const Offset(0, 0),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      color: Color(0xFFE9EFEC),
                    ),
                    height: 50,
                    width: 160,
                    child: const Text('Облачно, 12 градусов'),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
