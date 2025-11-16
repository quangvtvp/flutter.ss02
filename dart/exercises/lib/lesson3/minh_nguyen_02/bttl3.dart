import 'dart:io';

void main() {
  print('nhap thu nhap cua ban duoi dang so thuc-trieu dong');
  var tn = double.tryParse(stdin.readLineSync()!);
  if (tn != null && tn >= 0) {
    if (tn < 11) {
      print('so thue ban phai tra la: 0%');
    } else if (tn < 20) {
      print('so thue ban phai tra la: 5%');
    } else if (tn < 32) {
      print('so thue ban phai tra la:10%');
    } else {
      print('so thue ban phai tra la: 20%');
    }
  } else {
    print('khong hop le');
  }
}
