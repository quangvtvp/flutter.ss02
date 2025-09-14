import 'dart:io';

void main() {
  print('nhap dung luong data ban su dung - GB');
  var data = double.tryParse(stdin.readLineSync()!);
  if (data == null || data < 0) {
    print('khong hop le');
    return;
  }
  double x = data - 3;
  int mucvuot = x.ceil();
  if (mucvuot <= 0) {
    print('khong phai tra phi');
  } else {
    print('so tien ban can tra la: ${mucvuot * 20000} VND');
  }
}
