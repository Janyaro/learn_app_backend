
import 'package:flutter/material.dart';
import 'package:frontendd/view/screen1.dart';
import 'package:frontendd/view/screen2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text("Easy paisa"),
        centerTitle: true,
      ),
      body:PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: [
          Screen1(),
          Screen2()
        ],
      )
    );
  }
}