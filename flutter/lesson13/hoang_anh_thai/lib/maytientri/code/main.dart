import 'package:flutter/material.dart';
import 'doan.dart';
import 'ketqua.dart';

void main() {
  runApp(const MYAPP());
}

class MYAPP extends StatelessWidget {
  const MYAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Máy Tiên Tri',
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            toolbarHeight: 70,
            title: Container(
              margin: const EdgeInsets.only(top: 10),
              child: const Text(
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
            backgroundColor: const Color(0XFF904CA3),
            centerTitle: true,
          ),
        ),

        body: const Column(children: [Doan(), KetQuaView()]),
      ),
    );
  }
}
