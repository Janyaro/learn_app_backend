import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fronted_app/view/disply_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  bool isLoading = false;
Future<void> postUser(String name, String email , String age) async {
  setState(() => isLoading = true);
  
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        age: int.parse(age)
      }),
    );

    final responseData = jsonDecode(response.body);
    
    if (response.statusCode == 201) {
      print("Todo added successfully: $responseData");
    } else {
      print('Error: ${response.statusCode}, ${response.body}');
      throw Exception(responseData['error'] ?? 'Failed to add todo');
    }
  } catch (e) {
    print('Network error: $e');
    rethrow;
  } finally {
    if (mounted) {
      setState(() => isLoading = false);
    }
  }
}


   @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add User',style: TextStyle(color: Colors.white,fontSize: 24),),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             TextFormField(
              controller: userController,
              decoration:const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                hintText: "Enter Username here",
                border:OutlineInputBorder()
              ),
             ),
             const SizedBox(height:10,),
             TextFormField(
              controller: emailController,
              decoration:const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                hintText: "Enter Email here",
                border:OutlineInputBorder()
              ),
             ),
             const SizedBox(height:10,),
             TextFormField(
              controller: ageController,
              decoration:const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                hintText: "Enter you age here",
                border:OutlineInputBorder()
              ),
             ),
             const SizedBox(height:10,),
             GestureDetector(
              onTap: ()async{
                  if (ageController.text.isEmpty || int.tryParse(ageController.text) == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Age must be a number!")),
    );
    return;
  }
                try {
        await  postUser(userController.text, emailController.text, ageController.text);
                  
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Data saved successfully'), backgroundColor: Colors.green),);
          
                } catch (e) {
                  print(e);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('An error occurred'+), backgroundColor: Colors.red),
          // );
                  
                }
              },
               child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(4)
                ),
                child:const Center(
                  child: Text('Add User' , style: TextStyle(color: Colors.white ,fontSize: 19),),
                ),
               ),
             ),
             TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplyScreen()));
             }, child: Text('Disply all User'))
            ],
          ),
        )
      ),
    );
  }
}