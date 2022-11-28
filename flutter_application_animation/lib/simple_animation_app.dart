import 'package:flutter/material.dart';

class SimpleAnimationApp extends StatelessWidget {
  const SimpleAnimationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late Animation<double> animation1;
  late AnimationController controller1;

  late Animation<Offset> animation2;
  late AnimationController controller2;

  bool isShowed = true;
  bool toggled = true;
  @override
  void initState() {
    super.initState();

    controller1 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    // CurvedAnimation curved =
    //     CurvedAnimation(parent: controller, curve: Curves.bounceOut);

    // Tween<double> tween = Tween<double>(begin: 0, end: 200);
    // // animation = tween.animate(controller);
    // animation = tween.animate(curved);

    // animation.addListener(() {
    // if (controller.isCompleted) {
    //   controller.reset();
    //   // controller.reverse();
    // }
    // setState(() {});
    // });

    animation1 = Tween<double>(begin: 0, end: 200)
        .animate(CurvedAnimation(parent: controller1, curve: Curves.bounceOut))
      ..addListener(() {
        if (controller1.isCompleted) {
          controller1.reset();
        }
        setState(() {});
      });

    animation2 =
        Tween<Offset>(begin: const Offset(0, 0), end: const Offset(2, 3))
            .animate(CurvedAnimation(parent: controller2, curve: Curves.easeIn))
          ..addListener(() {
            if (controller2.isCompleted) {
              controller2.reverse();
            }
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 800),
                  // transitionsBuilder:
                  //     (context, animation, secondaryAnimation, child) {
                  //   return ScaleTransition(
                  //     scale: animation,
                  //     child: FadeTransition(opacity: animation, child: child),
                  //   );
                  // },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var anim = Tween<Offset>(
                            begin: const Offset(0, 1), end: const Offset(0, 0))
                        .animate(animation);

                    return SlideTransition(
                      position: anim,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const DetailedView(),
                ));
              },
              child: const Text('Details')),
          SizedBox(
              height: 200,
              width: 200,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                switchInCurve: Curves.bounceInOut,
                child: toggled
                    ? Container(
                        width: 100,
                        height: 100,
                        color: Colors.purple,
                        key: const Key('container-1'),
                      )
                    : Container(
                        width: 200,
                        height: 200,
                        color: Colors.green,
                        key: const Key('container-2'),
                      ),
              )),
          AnimatedOpacity(
              opacity: isShowed ? 0 : 1,
              duration: const Duration(seconds: 1),
              child: const Icon(
                Icons.accessibility,
                size: 80,
              )),
          SlideTransition(
            position: animation2,
            child: const Icon(
              color: Colors.red,
              Icons.directions_bike,
              size: 80,
            ),
          ),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                  left: animation1.value,
                  child: const Icon(
                    Icons.directions_bike,
                    size: 80,
                  )),
            ],
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // controller1.forward();
          // controller2.forward();
          setState(() {
            isShowed = !isShowed;
            toggled = !toggled;
          });
        },
      ),
    );
  }
}

class DetailedView extends StatelessWidget {
  const DetailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(),
      body: Column(children: const [Text('xfdhsgsfgjshbdfbsgbsfgbshbsfghfh')]),
    );
  }
}
