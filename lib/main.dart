import 'package:flutter/material.dart';
import 'package:online_service_app/pages/homePage.dart';

void main() {
  runApp(MyApp());
}

const MaterialColor _white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SwiggyUI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: _white,
        shadowColor: _white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(
        seselectedIndex: 0,
      ),
    );
  }
}
