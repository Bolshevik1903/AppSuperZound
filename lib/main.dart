import 'package:flutter/material.dart';
import 'package:music_flutter/ui/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppSuperZound',
      home: Home(),
    );
  }
}
