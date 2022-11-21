import 'package:cict_map/screens/home_screen_1.dart';
import 'package:cict_map/screens/intro_screen.dart';
import 'package:cict_map/screens/paint_screen.dart';
import 'package:cict_map/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      routes: {
        IntroScreen.routeName: (context) => const IntroScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomeScreen1.routeName: (context) => const HomeScreen1(),
        ImageOnCanvas.routeName:(context) => const ImageOnCanvas()
      },
    );
  }
}

