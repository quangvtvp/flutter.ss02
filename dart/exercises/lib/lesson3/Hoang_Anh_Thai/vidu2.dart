import 'dart:io';

void main() {
  print('Nhập tuổi:');
  int? tuoi = int.tryParse(stdin.readLineSync()!);
  if (tuoi == null || tuoi < 0) {
    print('Tuổi không hợp lệ');
    return;
  }
  if (tuoi >= 18) {
    print('Đủ điều kiện thi bằng lái');
  } else {
    print('Chưa đủ tuổi');
  }
}
