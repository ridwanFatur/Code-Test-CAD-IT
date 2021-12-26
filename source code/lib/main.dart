import 'package:code_test_app/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Test App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "NotoSans",
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

