import 'dart:io';

import 'package:flutter/material.dart';

class MyGameScreen extends StatelessWidget {
  const MyGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future career prediction machine'),
        backgroundColor: const Color(0xFF7E57C2),
        foregroundColor: Color.fromARGB(255, 222, 206, 251),
      ),
      body: Container(
        height: 300,
        width: 1000 ,       
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 125, 125, 125),
              blurRadius: 10,
              offset: const Offset(0, 4)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text('Please enter your infomation',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF7E57C2),
              ),),
            
            SizedBox(height: 16),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Full name',
                hintText: "enter your name",
                prefixIcon: Icon(Icons.person_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Color(0xFF7E57C2), width: 0.1),
                )
              ),
            ),
        
            SizedBox(height: 15),
        
            TextField(
              decoration: InputDecoration(
                labelText: 'Decribe yourself',
                prefixIcon: Icon(Icons.description_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(color: Color(0xFF7E57C2), width: 0.1),
                )
        
              ),
            )
          ],
        ),
      )
    );
  }
}