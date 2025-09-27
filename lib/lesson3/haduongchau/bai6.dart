import 'dart:io';

void main() {
  print('Xin chao ban!');
  print('Vui long nhap so luong ton kho');
  int? hangTonKho = int.tryParse(stdin.readLineSync() ?? '');
  if (hangTonKho == null || hangTonKho < 0) {
    print('So luong hang ton kho khong hop le. Vui long nhap lai.');
    return;
  } else {
    print('So luong hang ton kho: $hangTonKho');
  }
  if (hangTonKho == 0) {
    print('Canh bao het hang.');
  } else if (hangTonKho < 5) {
    print('Sap het hang');
  } else {
    print('Du hang.');
  }
}
