import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:frontendd/view/Components/reusebtn.dart';
import 'package:frontendd/view/Components/reusetextform.dart';
import 'package:image_picker/image_picker.dart';

class AddproductScreen extends StatefulWidget {
  const AddproductScreen({super.key});

  @override
  State<AddproductScreen> createState() => _AddproductScreenState();
}

class _AddproductScreenState extends State<AddproductScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final collection = FirebaseFirestore.instance.collection("Stocks");
  final _picker = ImagePicker();
  XFile? _selectedFile;
  Future<void> saveData(String titleController , String descriptionController ) async{
    if(_selectedFile == null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select an Image')));
      return;
    }
    final file = File(_selectedFile!.path);
    final String filename = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      final storage = await FirebaseStorage.instance.ref().child("ProductImage").child("${filename}.jpg");
     await storage.putFile(file);
     String imgUrl = await storage.getDownloadURL();
     String id = DateTime.now().microsecondsSinceEpoch.toString();
     collection.doc(id).set({
      "title":titleController,
      "description":descriptionController,
      "imgUrl":imgUrl
     });
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Successfully Data save in firebase')));
    } catch (e) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:const Text('Add product',style: TextStyle(color: Colors.white , fontSize: 24)),
        centerTitle: true,
          backgroundColor: Colors.green.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20,),
            Reusetextform(controller: titleController, title: 'Add product Title here'),
            const SizedBox(height: 10,),
            Reusetextform(controller: descriptionController, title: 'Add product description here'),
           const SizedBox(height: 10,),
Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               const Text('Please click product image' , style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                ),),
                Container(
                  
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    
                    border: Border.all(
                      width: 2,
                      color: Colors.deepPurple
                    )
                  ),
                  child: IconButton(onPressed: ()async{
                    final image =await _picker.pickImage(source: ImageSource.camera);
                    if (image != null) {
                     setState(() {
                       _selectedFile = image;
                     }); 
                     ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Image Selected!'),
                        duration: Duration(seconds: 2),
                     ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select an Image!'),
                        duration: Duration(seconds: 2),
                     ));
                    }
                    
                  }, icon:const Icon(Icons.image)))
              ],
            ),
            const SizedBox(height: 10,),
            Reusebtn(btnTitle: 'Upload Data', ontap: () async {
  String id = DateTime.now().microsecondsSinceEpoch.toString();
  print("ID: $id");
  print("Title: ${titleController.text}");
  print("Description: ${descriptionController.text}");

   saveData(titleController.text , descriptionController.text).then((val) {
    print("Data uploaded successfully");
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data successfully saved in Firebase')));
  }).onError((err, stackTrace) {
    print("Error: $err");
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error saving data to Firestore')));
  });
})

          ],
        ),
      ),
    );
  }
}

