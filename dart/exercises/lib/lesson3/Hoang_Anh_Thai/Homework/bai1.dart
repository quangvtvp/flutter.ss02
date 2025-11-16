import 'dart:io';

void main() {
  print('Nhập điểm:');
  int? diem = int.tryParse(stdin.readLineSync()!);
  if (diem == null || diem <= 0 || diem > 100) {
    print('Điểm không hợp lệ');
    return;
  }
  switch (diem) {
    case var diem when diem >= 90:
      print('Xuất sắc');
      break;
    case var diem when diem >= 80:
      print('Giỏi');
      break;
    case var diem when diem >= 65:
      print('Khá');
      break;
    case var diem when diem >= 50:
      print('Trung bình');
      break;
    default:
      print('Yếu');
  }
}
