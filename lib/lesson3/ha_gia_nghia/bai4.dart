import 'dart:io';
void main() {
  print('nhap xep loai(A,B,C,D)');
  String ? xeploai = stdin.readLineSync() ?? '';
  if (xeploai == 'A' || xeploai == 'a') {
    print('ban duoc HK tot');
  } else if (xeploai == 'B' || xeploai =='b') {
    print ('ban duoc HK kha');
} else if (xeploai == 'C' || xeploai == 'c') {
  print ('ban duoc HK TB');
} else if (xeploai == 'D' || xeploai == 'd') {
  print ('Khó nha bro khó nha,HK yếu ');
} else {
  print ('nhap sai roi bro,vui long nhap lai');
}
}