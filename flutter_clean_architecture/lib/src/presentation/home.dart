import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/domain/state/home/home_state.dart';
import 'package:flutter_clean_architecture/src/internal/dependencies/home_module.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _longController = TextEditingController();

  late HomeState _homeState;

  @override
  void initState() {
    super.initState();

    _homeState = HomeModule.homeState();
  }

  void _getDay() {
    final lat = double.tryParse(_latController.text) ?? 0;
    final long = double.tryParse(_longController.text) ?? 0;

    _homeState.getDay(latitude: lat, longitude: long);
  }

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
              Observer(
                builder: (_) {
                  if (_homeState.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (_homeState.day == null) {
                    return const Center(
                      child: Text('No data'),
                    );
                  }

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Восход: ${_homeState.day!.sunrise.toLocal()}'),
                      Text('Закат: ${_homeState.day!.sunset.toLocal()}'),
                      Text('Полдень: ${_homeState.day!.solarNoon.toLocal()}'),
                      Text(
                          'Продолжительность: ${Duration(seconds: _homeState.day!.dayLength)}'),
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }
}
