import 'dart:io';

void main() {
  print('nhap khung gio bang so:');
  String? time = stdin.readLineSync();
  var hour = int.tryParse(time!);
  if (hour != null) {
    if (hour < 0 || hour > 24) {
      print('gio khong hop le');
    } else if (hour <= 12) {
      print('chao buoi sang');
    } else if (hour <= 18) {
      print('chao buoi chieu');
    } else if (hour <= 24) {
      print('chao buoi toi');
    }
  } else {
    print('ban da nhap sai');
  }
}
