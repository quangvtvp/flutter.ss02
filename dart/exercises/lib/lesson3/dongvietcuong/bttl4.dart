import 'dart:io';

void main() {
  print("Nhập hạnh kiểm (A/B/C/D):");
  String? input = stdin.readLineSync();
  String hk = (input ?? '').toUpperCase(); 
  switch (hk) {
    case "A":
      print("Hạnh kiểm: Tốt");
      break;
    case "B":
      print("Hạnh kiểm: Khá");
      break;
    case "C":
      print("Hạnh kiểm: Trung bình");
      break;
    case "D":
      print("Hạnh kiểm: Yếu");
      break;
    default:
      print(" Giá trị nhập không hợp lệ!");
  }
}
