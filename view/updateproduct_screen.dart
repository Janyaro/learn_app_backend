import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontendd/view/Components/reusebtn.dart';
import 'package:frontendd/view/Components/reusetextform.dart';
import 'package:frontendd/view/home_screen.dart';

class UpdateproductScreen extends StatefulWidget {
  final String id;
  const UpdateproductScreen({super.key, required this.id});

  @override
  State<UpdateproductScreen> createState() => _UpdateproductScreenState();
}

class _UpdateproductScreenState extends State<UpdateproductScreen> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  String? imgUrl;
  bool isLoading = true;

  Future<void> getData() async {
    final doc = await FirebaseFirestore.instance.collection("Stocks").doc(widget.id).get();
    final data = doc.data() as Map<String, dynamic>;

    titleController = TextEditingController(text: data['title']);
    descriptionController = TextEditingController(text: data['description']);
    imgUrl = data['imgUrl'];

    setState(() {
      isLoading = false;
    });
  }

  Future<void> updateData() async {
    await FirebaseFirestore.instance.collection("Stocks").doc(widget.id).update({
      'title': titleController.text.trim(),
      'description': descriptionController.text.trim(),
      'imgUrl': imgUrl, // this remains unchanged unless you update it
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Product updated successfully")),
    );
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(title: const Text("Update Product")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Reusetextform(controller: titleController, title: 'Product Title'),
              const SizedBox(height: 10),
              Reusetextform(controller: descriptionController, title: 'Product Description'),
              const SizedBox(height: 20),
              if (imgUrl != null)
                Image.network(imgUrl!, height: 150),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Click to select new image',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2, color: Colors.deepPurple),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.image),
                      onPressed: () {
                        updateData().then((val)=>{
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Data update'))),
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()))
                        });
                        // Optional: add image picker logic here
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Reusebtn(btnTitle: 'Update Data', ontap: updateData),
            ],
          ),
        ),
      ),
    );
  }
}
