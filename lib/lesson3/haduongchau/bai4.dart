import 'dart:io';

void main() {
  print('nhap xep loai(A,B,C,D)');
  String? xeploai = stdin.readLineSync() ?? '';
  if (xeploai == 'A' || xeploai == 'a') {
    print('ban duoc HK tot');
  } else if (xeploai == 'B' || xeploai == 'b') {
    print('ban duoc HK kha');
  } else if (xeploai == 'C' || xeploai == 'c') {
    print('ban duoc HK TB');
  } else if (xeploai == 'D' || xeploai == 'd') {
    print('ban duoc HK yeu ');
  } else {
    print('Vui long nhap lai(A,B,C,D)');
  }
}
