import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:testing_farebase/adding.dart';

class Screen1 extends StatelessWidget {
   Screen1({super.key});

  final data =FirebaseFirestore.instance.collection('details');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:const Text('Home'),
      ),
      body: StreamBuilder(
  stream: data.snapshots(),
  builder: (context, snapshot) {
    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
      return const Center(
        child: Text('No data available'),
      );
    }

    return ListView.separated(
      itemBuilder: (context, index) {
        var docs = snapshot.data!.docs[index];
        String name = docs['name'];
        String phNo = docs['phone'];

        return ListTile(
          title: Text(name),
          subtitle: Text(phNo),
          trailing: IconButton(
            onPressed: () {
              deleteData(docs.id);
            },
            icon: const Icon(Icons.delete),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: snapshot.data!.docs.length,
    );
  },
),

      floatingActionButton:FloatingActionButton(
            child:const  Icon(Icons.add),
            onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AddingData(),));

          },) ,
    );
  }
   void deleteData(String documentId) async {
    try {
      await data.doc(documentId).delete();
      print('Data deleted successfully');
    } catch (e) {
      print('Error deleting data: $e');
    }
  }
}

