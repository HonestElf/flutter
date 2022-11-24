// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:hotels/api/get_hotels.dart';
import 'package:hotels/models/hotel.dart';
import 'package:hotels/views/hotel_preview_card.dart';

enum LayoutType { list, grid }

class HomeView extends StatefulWidget {
  static const routeName = '/';
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

      _hotels = response
          .map<HotelPreview>((json) => HotelPreview.fromJson(json))
          .toList();

      setState(() {
        isLoading = false;
        hasError = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 207, 202, 202),
        appBar: AppBar(title: const Text('App bar'), actions: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            child: GestureDetector(
              onTap: (() {
                setState(() {
                  layout = LayoutType.list;
                });
              }),
              child: const Icon(Icons.list),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 0),
            child: GestureDetector(
              onTap: (() {
                setState(() {
                  layout = LayoutType.grid;
                });
              }),
              child: const Icon(Icons.grid_view_sharp),
            ),
          )
        ]),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : hasError
                ? const Center(child: Text('Сервис временно не доступен'))
                : Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: layout == LayoutType.list
                        ? Column(
                            children: [
                              Expanded(
                                child: ListView.separated(
                                  itemCount: _hotels.length,
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(
                                    height: 10,
                                  ),
                                  itemBuilder:
                                      ((BuildContext context, int index) {
                                    return HotelPreviewCard(
                                        hotel: _hotels[index]);
                                  }),
                                ),
                              ),
                            ],
                          )
                        : GridView.count(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            children: <Widget>[
                              ..._hotels
                                  .map(
                                    (hotel) =>
                                        HotelPreviewSmallCard(hotel: hotel),
                                  )
                                  .toList()
                            ],
                          )));
  }
}
