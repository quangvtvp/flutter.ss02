import 'dart:io';

void main() {
  print('dang ky goi ho tro (Free/Pro/Business/Enterprise):');
  var goi = stdin.readLineSync();
  switch (goi) {
    case 'Free':
      print('thoi gian phan hoi cam ket: 72h');
      break;
    case 'Pro':
      print('thoi gian phan hoi cam ket:24h');
      break;
    case 'Business':
      print('thoi gian phan hoi cam ket:8h');
      break;
    case 'Enterprise':
      print('thoi gian phan hoi cam ket:2h');
      break;
    default:
      print('khong hop le');
  }
}
