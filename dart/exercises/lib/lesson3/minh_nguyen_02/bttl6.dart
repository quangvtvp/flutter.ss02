import 'dart:io';

void main() {
  print('nhap so luong hang hoa duoi dang so');
  var sl = int.tryParse(stdin.readLineSync()!);
  if (sl != null && sl >= 0) {
    if (sl == 0) {
      print('het hang');
    }
    if (sl < 5) {
      print('hang sap het');
    } else {
      print('du hang');
    }
  } else {
    print('khong hop le');
  }
}
