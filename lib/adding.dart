import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddingData extends StatelessWidget {
   AddingData({super.key});

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Add details"),
      ),
      body: Padding(padding:const EdgeInsets.all(20),
       child: Form(
        key:_formKey ,
         child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              validator: (value) {
                if(value==null||value.isEmpty){
                  return 'required';
                }return null;
              },
              decoration:const InputDecoration(  
                hintText: 'name'
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _phoneController,
              validator: (value) {
                if(value==null||value.isEmpty){
                  return 'required';
                }return null;
              },
               decoration:const InputDecoration(  
                hintText: 'phone no'
              ), 
            ),
           const  SizedBox(height: 20,),
           ElevatedButton(onPressed: (){
            addData();
           },
            child:const Text("add details")) 
          ],
         ),
       ),
      ),
      
    );
  }

    void addData() async {
  try {
    if (_formKey.currentState!.validate()) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('details').add({
        'name': _nameController.text,
        'phone': _phoneController.text,
      });
      _nameController.clear();
      _phoneController.clear();
    }
  } catch (e) {
    debugPrint('Error adding data: $e');
  }
}


}