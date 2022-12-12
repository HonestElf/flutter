import 'package:advanced_widgets_homework/src/customWidget/inner_shadow.dart';
import 'package:advanced_widgets_homework/src/theme_widget.dart';
import 'package:advanced_widgets_homework/src/weather_widget/weather_painter.dart';
import 'package:flutter/material.dart';

class WeatherWidget extends StatefulWidget {
  final double weatherCondition;
  const WeatherWidget({super.key, required this.weatherCondition});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1, end: 2)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut))
      ..addListener(() {
        setState(() {});
      });
  }

  void switchScale() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
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
          ScaleTransition(
            scale: _animation,
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: AppThemeWidget.of(context).primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              width: 80,
              height: 80,
              child: CustomPaint(
                painter: CustomWeatherPainter(
                    weatherCondition: widget.weatherCondition),
              ),
            ),
          ),
          _controller.isCompleted
              ? Container(
                  margin: const EdgeInsets.only(top: 80),
                  child: InnerShadow(
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
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
