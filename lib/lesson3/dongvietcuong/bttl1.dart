import 'dart:io';

void main() {
  print("Nhập điểm rèn luyện (0–100):");
  int? rl = int.tryParse(stdin.readLineSync() ?? "0");
  if (rl == null || rl < 0 || rl > 100) {
    print("Điểm rèn luyện không hợp lệ!");
  } else {
    if (rl >= 90) {
      print("Xuất sắc");
    } else if (rl >= 80) {
      print(" Tốt");
    } else if (rl >= 65) {
      print(" Khá");
    } else if (rl >= 50) {
      print(" Trung bình");
    } else {
      print(" Yếu");
    }
  }
}
