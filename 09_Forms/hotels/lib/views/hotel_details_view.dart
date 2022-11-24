// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';

// Project imports:
import 'package:hotels/api/get_hotels.dart';
import 'package:hotels/models/hotel_details.dart';

class HotelDetailsView extends StatefulWidget {
  static const routeName = '/details';
  final String uuid;
  const HotelDetailsView({super.key, required this.uuid});

  @override
  State<HotelDetailsView> createState() => _HotelDetailesViewState();
}

class _HotelDetailesViewState extends State<HotelDetailsView> {
  bool isLoading = false;
  bool hasError = false;
  String errorText = '';
  HotelDetails? _details;

  @override
  void initState() {
    super.initState();
    getHotelDetailData();
  }

  void getHotelDetailData() async {
    setState(() {
      isLoading = true;
      hasError = false;
    });
    try {
      final response = await getHotelDetails(widget.uuid);

      _details = HotelDetails.fromJson(response);

      setState(() {
        isLoading = false;
        hasError = false;
      });
    } catch (error) {
      var errorBody = error as Map<String, dynamic>;
      setState(() {
        if (errorBody.containsKey('message')) {}
        errorText = errorBody.containsKey('message')
            ? errorBody['message']
            : 'Сервис временно не доступен';
        isLoading = false;
        hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : hasError
                    ? Center(child: Text(errorText))
                    : Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 5),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                child: CarouselSlider(
                                    options: CarouselOptions(
                                        height: 200,
                                        enlargeCenterPage: true,
                                        padEnds: true,
                                        enableInfiniteScroll: true),
                                    items: [
                                      ..._details!.photos
                                          .map((photo) => Container(
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            'assets/images/$photo'))),
                                              ))
                                          .toList()
                                    ]),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: RichText(
                                          text: TextSpan(
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              children: [
                                            const TextSpan(text: 'Страна: '),
                                            TextSpan(
                                                text: _details!.address.country,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ]))),
                                  Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: RichText(
                                          text: TextSpan(
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              children: [
                                            const TextSpan(text: 'Город: '),
                                            TextSpan(
                                                text: _details!.address.city,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ]))),
                                  Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: RichText(
                                          text: TextSpan(
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              children: [
                                            const TextSpan(text: 'Улица: '),
                                            TextSpan(
                                                text: _details!.address.street,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ]))),
                                  Padding(
                                      padding: const EdgeInsets.only(bottom: 5),
                                      child: RichText(
                                          text: TextSpan(
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                              children: [
                                            const TextSpan(text: 'Рейтинг: '),
                                            TextSpan(
                                                text: '${_details!.rating}',
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ))
                                          ]))),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: Text(
                                  'Сервисы',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                              'Платные',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ..._details!.services.paid
                                              .map((service) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 3),
                                                  child: Text(service)))
                                              .toList()
                                        ]),
                                  ),
                                  SizedBox(
                                    width: 150,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                              'Бесплатно',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          ..._details!.services.free
                                              .map((service) => Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 3),
                                                  child: Text(service)))
                                              .toList()
                                        ]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ))));
  }
}
