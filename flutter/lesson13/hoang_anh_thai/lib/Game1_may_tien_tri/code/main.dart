import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hoang_anh_thai/Game1_may_tien_tri/code/ketqua.dart';
import 'resource.dart';
import 'doan.dart';

void main() {
  runApp(MYAPP());
}

class MYAPP extends StatelessWidget {
  const MYAPP({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            toolbarHeight: 70,
            title: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "MÁY TIÊN TRI",
                style: TextStyle(
                  fontSize: 45,
                  color: Color.fromARGB(255, 255, 255, 255),
                  wordSpacing: 3,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            backgroundColor: Color(0XFF904CA3),
            centerTitle: true,
          ),
        ),
        body: Column(children: [doan(), ketqua()]),
      ),
    );
  }
}
