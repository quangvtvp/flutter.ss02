import 'package:flutter/material.dart';

Container doan() {
  return Container(
    alignment: Alignment.topCenter,
    height: 270,
    margin: EdgeInsets.all(20),
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: 800,
      height: 230,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            child: Text(
              'Nhập',
              style: TextStyle(
                fontFamily: 'innghieng',
                fontSize: 25,
                letterSpacing: 2,
              ),
            ),
          ),
          Container(
            height: 55,
            margin: EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Tên',
                hintText: 'Nhập tên của bạn',
                hintStyle: TextStyle(
                  fontFamily: 'innghieng',
                  fontStyle: .italic,
                  fontWeight: FontWeight.w700,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Color(0xFF7E57C2),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 3),
            height: 55,
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Info',
                hintText: 'Mô tả',
                hintStyle: TextStyle(
                  fontFamily: 'innghieng',
                  fontStyle: .italic,
                  fontWeight: FontWeight.w700,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                prefixIcon: Icon(
                  Icons.description_outlined,
                  color: Color(0xFF7E57C2),
                ),
              ),
            ),
          ),
          Container(
            height: 45,
            margin: EdgeInsets.only(left: 300, right: 300),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.auto_awesome),
              label: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7E57C2),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
