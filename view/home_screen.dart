import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:frontendd/view/updateproduct_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference collection = FirebaseFirestore.instance.collection("Stocks");
  
  get builder => null;
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard', style: TextStyle(color: Colors.white , fontSize: 24),),
          centerTitle: true,
          backgroundColor: Colors.green.shade400,
       leading:Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Icon(Icons.more_horiz , color: Colors.white,),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // ✅ This context is now inside Scaffold
          },
        );
      },
    ),
        ),
       
        drawer:const Drawer(
              
          width: 220,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.home),
                title: Text("HomeScreen"),
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text("Add Product"),
              ),
              ListTile(
                leading: Icon(Icons.update),
                title: Text("Update Product"),
              ),
            ],
          ),
        ),
        body:StreamBuilder<QuerySnapshot>(stream:collection.snapshots(), 
        builder: (context,snapshot){
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context,index){
          final data = snapshot.data!.docs;
          
            return ListTile(
              leading: Image.network(data[index]['imgUrl'].toString()),
            title: Text(data[index]['title'].toString()),
            subtitle: Text(data[index]['description'].toString()),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateproductScreen(id:data[index].id,)));
              // collection.doc(data[index].id).update({data});
            }, icon: Icon(Icons.update , color: Colors.green.shade700,)),
            IconButton(onPressed: (){
              collection.doc(data[index].id).delete();
            }, icon: Icon(Icons.delete , color: Colors.red,)),
              ],
            )
            
            );
          });
        })
      ),
    );
  }
}