import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/domain/model/day.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();

  Day? _day;

  void _getDay() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                      child: TextField(
                    controller: _latController,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true, signed: true),
                    decoration: const InputDecoration(hintText: 'Широта'),
                  )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextField(
                    controller: _longController,
                    keyboardType: const TextInputType.numberWithOptions(
                        decimal: true, signed: true),
                    decoration: const InputDecoration(hintText: 'Долгота'),
                  ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    _getDay();
                  },
                  child: const Text('Получить')),
              const SizedBox(
                height: 20,
              ),
              if (_day != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Восход: ${_day!.sunrise.toLocal()}'),
                    Text('Закат: ${_day!.sunset.toLocal()}'),
                    Text('Полдень: ${_day!.solarNoon.toLocal()}'),
                    Text(
                        'Продолжительность: ${Duration(seconds: _day!.dayLength)}'),
                  ],
                ),
            ],
          ),
        ));
  }
}
