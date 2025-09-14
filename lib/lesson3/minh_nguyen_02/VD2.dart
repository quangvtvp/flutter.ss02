import 'dart:io';

void main() {
  print('nhap tuoi cua ban theo dang so');
  var input = stdin.readLineSync();
  var tuoi = int.tryParse(input!);
  if (tuoi == null || tuoi < 0 || tuoi > 100) {
    print('khong hop le');
    return;
  }
  if (tuoi < 18) {
    print('chua du tuoi');
  } else {
    print('du dieu kien thi bang lai');
  }
}
