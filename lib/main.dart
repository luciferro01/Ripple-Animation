import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const RippleAnimation(),
    );
  }
}

//Ripple Animation
class RippleAnimation extends StatefulWidget {
  const RippleAnimation({super.key});

  @override
  State<RippleAnimation> createState() => _RippleAnimationState();
}

class _RippleAnimationState extends State<RippleAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _radiusController;
  late Animation<double> _rotationController;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..forward();

    //Rotation Animation
    _rotationController = Tween(
      begin: 0.0,
      end: 2.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _radiusController = Tween(
      begin: 450.0,
      end: 10.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {});
    });
    super.initState();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  void dispose() {
    _radiusController;
    _rotationController;
    _controller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[300],
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              angle: _rotationController.value,
              child: Container(
                width: 290,
                height: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radiusController.value),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.8),
                        offset: const Offset(6, 6)),
                  ],
                  color: Colors.deepPurple[900],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationController.value + 0.2,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radiusController.value),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      offset: const Offset(6, 6),
                    ),
                  ],
                  color: Colors.deepPurple[500],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationController.value + 0.4,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radiusController.value),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.deepPurple[300]!.withOpacity(0.8),
                  //       offset: const Offset(6, 6)),
                  // ],
                  color: const Color.fromARGB(186, 219, 75, 192),
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationController.value + 0.4,
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radiusController.value),
                  boxShadow: [
                    BoxShadow(
                        // color: const Color.fromARGB(186, 219, 75, 192)
                        color: Colors.black.withOpacity(0.4),
                        offset: const Offset(-2, -2)),
                  ],

                  // color: Colors.deepPurple[400],
                  color: const Color.fromARGB(144, 136, 39, 119),
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationController.value + 0.4,
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radiusController.value),
                  color: Colors.deepPurple[400],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationController.value + 0.4,
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radiusController.value),
                  // color: Color.fromARGB(102, 107, 101, 118),
                  color: Colors.deepPurple[200],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationController.value + 0.5,
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radiusController.value),
                  color: Colors.deepPurple[100],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationController.value + 0.6,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radiusController.value),
                  color: const Color.fromARGB(108, 255, 137, 101),
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationController.value + 0.4,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_radiusController.value),
                  color: Colors.deepOrange[100],
                ),
              ),
            ),
            Transform.rotate(
              angle: _rotationController.value + 0.4,
              child: Container(
                width: 23,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(_radiusController.value - 5),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
