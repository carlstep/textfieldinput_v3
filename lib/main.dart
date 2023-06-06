import 'package:flutter/material.dart';
import 'package:textfieldinput_v3/text_input_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ConversionScreen(),
    );
  }
}
