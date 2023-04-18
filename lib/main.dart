import 'package:dailyboxoffice/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(
        today: (DateFormat('yyyyMMdd').format(DateTime.now())),
      ),
    );
  }
}
