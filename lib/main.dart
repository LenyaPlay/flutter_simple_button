import 'package:flutter/material.dart';
import 'package:simple_button/simple_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: SimpleButton(
              child: Container(
                color: Colors.black54,
                child: const SizedBox(
                  height: 32,
                  width: 64,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
