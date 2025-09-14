import 'dart:io';

void main() {
  print("Nhập điểm rèn luyện :");
  var input = stdin.readLineSync();
  double? diem = double.tryParse(input!);
  if (diem == null || diem < 0 || diem > 100) {
    print("Điểm không hợp lệ");
  } else if (diem >= 90) {
    print("Xuất sắc");
  } else if (diem >= 80) {
    print("Giỏi");
  } else if (diem >= 65) {
    print("Khá");
  } else if (diem >= 50) {
    print("trung bình");
  } else {
    print("Yếu");
  }
}
