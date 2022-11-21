import 'dart:async';
import 'package:flutter/material.dart';
import 'package:cict_map/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    secondState();
  }

  void secondState() async {
    await Future.delayed(const Duration(seconds: 10));
    Navigator.of(context).pushNamed(IntroScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints.expand(width: 360, height: 450),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/background.png",
              ),
              fit: BoxFit.scaleDown,
              opacity: 0.4,
            ),
          ),
          child: Center(
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    'Welcome to',
                    style: TextStyle(fontSize: 40, fontFamily: 'sen'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        'CICT',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 90,
                            fontFamily: 'sen'),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'Map',
                          style: TextStyle(fontSize: 60, fontFamily: 'sen'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
