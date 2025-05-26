import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fronted_app/model/user.model.dart';
import 'package:http/http.dart'as http;

class DisplyScreen extends StatefulWidget {
  const DisplyScreen({super.key});

  @override
  State<DisplyScreen> createState() => _DisplyScreenState();
}

class _DisplyScreenState extends State<DisplyScreen> {
  
List<Map<String , dynamic>> myusers = [];
 Future<List<UserModel>> getAllData() async {
  try {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/'));
    print("the status code is ${response.statusCode}");

    if (response.statusCode == 200) {
     List<dynamic> jsonData = json.decode(response.body);

      return jsonData.map((e) => UserModel.fromJson(e)).toList();
    } else {
      print("Error: ${response.statusCode}");
      return [];
    }
  } catch (e) {
    print("Caught error in getAllData(): $e");
    return [];
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Data')),
     body: FutureBuilder<List<UserModel>>(
  future: getAllData(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: Text('Thora wait karye...'));
    } else if (snapshot.hasError) {
      return Center(child: Text('Error: ${snapshot.error}'));
    } else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
      return const Center(child: Text('No data found'));
    } else {
      final users = snapshot.data!;
      return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(child: Text(user.name[0].toUpperCase())),
            title: Text(user.name),
            subtitle: Text('${user.email} - Age: ${user.age}'),
          );
        },
      );
    }
  },
),

     );
  }
}
