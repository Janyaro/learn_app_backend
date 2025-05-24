import 'package:flutter/material.dart';
import 'package:myflutter_app/View/home_screem.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:HomeScreen()
    );
  }
}