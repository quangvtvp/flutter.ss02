import 'package:flutter/material.dart';
import 'ten.dart';

Expanded ketqua() {
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(top: 10),
      width: 1000,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 5),
          Container(
            height: 60,
            alignment: Alignment.center,
            child: Text(
              'Kết quả',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 40,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: Container(
              width: 900,
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.solid),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: SingleChildScrollView(child: Ten()),
            ),
          ),
        ],
      ),
    ),
  );
}
