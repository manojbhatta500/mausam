import 'package:flutter/material.dart';
import 'package:mausam/screens/home.dart';
import 'package:mausam/screens/loading.dart';

void main() {
  runApp(const Mausam());
}

class Mausam extends StatelessWidget {
  const Mausam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/loading': (context) => Loading()
      },
    );
  }
}
