import 'dart:io';

void main() {
  print('nhập hạnh kiểm của bạn (A, B, C, D):');
  var hanhkiem = stdin.readLineSync() ?? '';
  switch (hanhkiem) {
    case 'A' || 'a':
      print('tốt');
      break;
    case 'B' || 'b':
      print('khá');
      break;
    case 'C' || 'c':
      print('trung bình');
      break;
    case 'D' || 'd':
      print('yếu');
      break;
    default:
      print('ủa có hạnh kiểm này hả ?');
  }
}
