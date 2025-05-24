import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myflutter_app/View/disply_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isLoading = false;
Future<void> postData(String title, String description) async {
  setState(() => isLoading = true);
  
  try {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/addtodo'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': title,
        'description': description,
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  hintText: 'Enter description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  if (titleController.text.isEmpty ||
                      descriptionController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Fields cannot be empty')),
                    );
                    return;
                  }

                  try {
                    await postData(
                      titleController.text,
                      descriptionController.text,
                    );

                    // Clear the fields after successful post
                    titleController.clear();
                    descriptionController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Todo added successfully')),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${e.toString()}')),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  color: Colors.deepPurple,
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Add Todo',
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplyScreen()),
                  );
                },
                child: const Text('Display Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}