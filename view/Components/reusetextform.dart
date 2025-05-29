import 'package:flutter/material.dart';

class Reusetextform extends StatelessWidget {
  final TextEditingController controller;
  final String title ;
  const Reusetextform({super.key, required this.controller , required this.title});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              controller: controller,
              decoration: InputDecoration(
              contentPadding:const EdgeInsets.symmetric(horizontal: 15 , vertical: 8),
                hintText: title,
                border:const OutlineInputBorder()
              ),
            );
  }
}