import 'dart:io';

void main() {
  print('nhap so gio cua ban theo dang so');
  var input = stdin.readLineSync();
  var gio = int.tryParse(input!);
  if (gio == null || gio < 0 || gio > 24) {
    print('khong hop le');
    return;
  }
  if (gio < 12) {
    print('chao buoi sang');
  } else if (gio < 18) {
    print('chao buoi chieu');
  } else {
    print('chao buoi toi');
  }
}
