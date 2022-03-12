import 'package:flutter/material.dart';
import 'screens/input.dart';

void main() {
  runApp(const BMICALCULATOR());
}

class BMICALCULATOR extends StatelessWidget {
  const BMICALCULATOR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF202430),
      ),
      home: const inputPage(),
    );
  }
}
