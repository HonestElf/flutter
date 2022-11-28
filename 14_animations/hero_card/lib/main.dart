import 'package:flutter/material.dart';
import 'package:hero_card/detailed_view.dart';
import 'package:hero_card/space.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeView(title: 'Animations'),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...spaces
                .map(
                  (item) => Card(
                    clipBehavior: Clip.hardEdge,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: SizedBox(
                      height: 130,
                      child: Stack(children: [
                        Hero(
                            tag: item.id,
                            child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          item.image,
                                        ),
                                        fit: BoxFit.fill)))),
                        Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Hero(
                                tag: '${item.id}-title',
                                child: Material(
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 20),
                                      height: 65,
                                      color: Colors.grey,
                                      child: Center(
                                        child: Text(
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          item.description,
                                        ),
                                      )),
                                ))),
                        Positioned(
                            bottom: 50,
                            right: 20,
                            child: Hero(
                                tag: '${item.id}-button',
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) {
                                        return DetailedView(data: item);
                                      },
                                    ));
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    color: Colors.yellow,
                                    child: const Icon(
                                      Icons.add,
                                    ),
                                  ),
                                )))
                      ]),
                    ),
                  ),
                )
                .toList()
          ],
        )),
      ),
    );
  }
}
