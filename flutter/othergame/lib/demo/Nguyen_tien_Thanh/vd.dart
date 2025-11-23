import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(List<String> args) {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body:  BodySreen()),
    ),
  );  
}
class BodySreen extends StatelessWidget {
  const BodySreen({super.key});
  @override
  Widget build(BuildContext context) { 
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround
      ,
     crossAxisAlignment: CrossAxisAlignment.center,
        
      children: [
        Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.green,
        ),
        Container(
          height: 100,
          width: 100,
          color: Colors.blue,
        ),
      ],
    );
  }
}