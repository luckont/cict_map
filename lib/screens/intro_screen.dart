// ignore_for_file: deprecated_member_use

import 'package:cict_map/screens/home_screen_1.dart';
import 'package:flutter/material.dart';
import './home_screen_1.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  static const routeName = '/intro_screen';
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                // color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeScreen1.routeName);
                },
                // ignore: prefer_const_constructors
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Tầng trệt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),

            ElevatedButton(
              // color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed(HomeScreen1.routeName);
              },
              // ignore: prefer_const_constructors
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Tầng lầu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
