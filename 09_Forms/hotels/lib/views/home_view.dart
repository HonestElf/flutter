// Flutter imports:

import 'package:flutter/material.dart';
import 'package:hotels/api/get_hotels.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/views/hotel_preview_card.dart';

enum LayoutType { list, grid }

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isLoading = false;
  bool hasError = false;
  List<HotelPreview> _hotels = [];

  LayoutType layout = LayoutType.list;

  @override
  void initState() {
    super.initState();

    getHotels();
  }

  getHotels() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });
    try {
      final response = await getData(
          'https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');

      print('response: $response');
      _hotels = response
          .map<HotelPreview>((json) => HotelPreview.fromJson(json))
          .toList();

      setState(() {
        isLoading = false;
        hasError = false;
      });
    } catch (error) {
      print('error: $error');

      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('App bar'), actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: GestureDetector(
              onTap: (() {
                print('List layout');
              }),
              child: const Icon(Icons.list),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            child: GestureDetector(
              onTap: (() {
                print('grid layout');
              }),
              child: const Icon(Icons.grid_view_sharp),
            ),
          )
        ]),
        body: Container(
            decoration: BoxDecoration(
              color: Colors.grey[350],
            ),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: _hotels.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(thickness: 1, color: Colors.grey[350]),
                    itemBuilder: ((BuildContext context, int index) {
                      return HotelPreviewCard(hotel: _hotels[index]);
                    }),
                  ),
                ),
              ],
            )));
  }
}
