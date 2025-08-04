import 'package:flutter/material.dart';
import 'package:meta_track/app/modules/splash/presenter/controller/splash_controller.dart';

class SplashView extends StatefulWidget {
  final SplashController controller;
  const SplashView({super.key, required this.controller});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    widget.controller.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(transform: GradientRotation(20), colors: [
          Colors.white,
          const Color.fromARGB(255, 120, 87, 217),
        ])),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// child: LinearProgressIndicator(
//                         color: const Color.fromARGB(255, 185, 154, 69),
//                       ),