import 'dart:io';

void main() {
  print('nhap tong tien mua hang theo dang so- don vi dong');
  var input = stdin.readLineSync();
  var tien = int.tryParse(input!);
  if (tien == null || tien < 0) {
    print('khong hop le');
    return;
  }
  if (tien >= 500000) {
    print('tien phi cua ban la 0 dong');
  } else if (tien >= 200000) {
    print('tien phi cua ban la 15000 dong');
  } else {
    print('tien phi cua ban la 30000 dong');
  }
}
