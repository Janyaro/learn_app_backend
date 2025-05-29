import 'package:flutter/material.dart';

class Reusebtn extends StatelessWidget {
  final String btnTitle;
  final VoidCallback ontap;
  const Reusebtn({super.key , required this.btnTitle,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
                 height: 50,
                 width: double.infinity,
                 decoration: BoxDecoration(
                  color: Colors.green.shade500,
                  borderRadius: BorderRadius.circular(8)
                 ),
                 child: Center(
                  child: Text(btnTitle, style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
                 ),
              ),
    );
  }
}