import 'dart:io';
void main() {
  print('Nhập hạnh kiểm (A/B/C/D):');
  String type = stdin.readLineSync()?.toUpperCase() ?? '';
  switch(type) {
    case 'A': print('Tốt'); break;
    case 'B': print('Khá'); break;
    case 'C': print('Trung bình'); break;
    case 'D': print('Yếu'); break;
    default: print('Không hợp lệ'); 
  }
}