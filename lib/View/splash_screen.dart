import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:covid_tracker/View/world_stats.dart'; // Make sure this import is correct.

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late final AnimationController _controller =
  AnimationController(duration: const Duration(seconds: 2), vsync: this)
    ..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    timer();
  }

  // This function will navigate to the next screen after 3 seconds
  void timer() {
    print("Timer started");
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        print("Navigating to WorldStatsScreen");
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WorldStatsScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Spinner animation for the splash screen
            AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return Transform.rotate(
                  angle: _controller.value * 2.0 * math.pi,
                  child: child,
                );
              },
              child: const SizedBox(
                height: 200,
                width: 200,
                child: Center(
                  child: Image(
                    image: AssetImage('images/virus.png'), // Make sure this path is correct in your pubspec.yaml
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Covid-19\nTracker App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
