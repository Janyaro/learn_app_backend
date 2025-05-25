import 'dart:async';
import 'dart:convert';
import 'package:blogapp/model/blog.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DisplyScreen extends StatefulWidget {
  const DisplyScreen({super.key});

  @override
  State<DisplyScreen> createState() => _DisplyScreenState();
}

class _DisplyScreenState extends State<DisplyScreen> {
Future<List<Post>> getAllBlog() async {
 
final response = await http.get(
  Uri.parse("http://10.0.2.2:3000/all")
);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => Post.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load blogs: ${response.statusCode}');
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Blogs", 
               style: TextStyle(color: Colors.white, fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: FutureBuilder<List<Post>>(
        future: getAllBlog(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No blogs available'));
          }
          
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final post = snapshot.data![index];
              return Card(
                elevation: 3,
                child: ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.content,
                          style: const TextStyle(fontSize: 18)),
                ),
              );
            },
          );
        },
      ),
    );
  }
}