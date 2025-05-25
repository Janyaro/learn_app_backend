import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: titleController,
              decoration:const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                hintText: 'Enter Title',
                border: OutlineInputBorder()  
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: contentController,
              decoration:const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                hintText: 'Enter blog description',
                border: OutlineInputBorder()  
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(child:isloading ? const Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(color: Colors.white,),
              ) : const Text('Add Blog' , style: TextStyle(color: Colors.white , fontSize: 18),),),
            )
          ],
        ),
      ),
    );
  }
}