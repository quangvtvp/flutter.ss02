import 'dart:io';

void main() {
  print("Hạnh kiểm:");
  var input = stdin.readLineSync();
  String? hk = input;
  switch (hk) {
    case "A":
      print("Tốt");
      break;
    case "B":
      print("Khá");
      break;
    case "C":
      print("trung bình");
      break;
    case "D":
      print("Yếu");
      break;
    default:
      print("Hạnh kiểm không hợp lệ");
  }
}
