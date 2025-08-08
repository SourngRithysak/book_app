import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget{
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen>{

  final _db = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4)
                )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)
                  )
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  Future<void> submitProduct() async {
    try{

    }catch(e){
      print(" Error : $e");
    }
  }
}