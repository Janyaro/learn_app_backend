import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutter_app/Model/todo.model.dart';

class DisplyScreen extends StatefulWidget {
  const DisplyScreen({super.key});

  @override
  State<DisplyScreen> createState() => _DisplyScreenState();
}

class _DisplyScreenState extends State<DisplyScreen> {
  Future<List<Todomodel>> getAllData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/getData'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      print(jsonData);
      return jsonData.map((todo) => Todomodel.fromJson(todo)).toList();
      
    } else {
      return [];
    }
  }

  Future<void> deleteTodo(String id)async{
    final response = await http.delete(Uri.parse('http://10.0.2.2:3000/deleteTodo/'));
    if(response.statusCode == 200){
      
        setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Todo deleted successfully')),
      );
    } else {
      throw Exception('Failed to delete todo: ${response.body}');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos')),
      body: FutureBuilder<List<Todomodel>>(
        future: getAllData(),
        builder: (context, snapshot) {
          // Check connection state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Check for error
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          // Check for data
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No todos found'));
          }

          // Data is available
          final todoList = snapshot.data!;

          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              final todo = todoList[index];
              return ListTile(
                title: Text(todo.title),
                subtitle: Text(todo.description),
                trailing: IconButton(onPressed: (){
                // deleteTodo();
                }, icon: Icon(Icons.delete , color: Colors.red,)),
              );
            },
          );
        },
      ),
    );
  }
}
