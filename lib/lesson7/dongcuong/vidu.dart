// ...existing code...
import 'dart:io';

void main() {
  var mapBook = [
    {'name': 'Doraemon', 'nam': 2020, 'gia': 15000},
    {'name': 'a', 'nam': 2020, 'gia': 15000},
  ];
  for (var i in mapBook) {
    print("ten sach: ${i['name']}, nam xb: ${i['nam']}, gia: ${i['gia']}");
  }
}

