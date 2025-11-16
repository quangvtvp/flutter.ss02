import 'dart:io';

void main() {
  print("Nhập:");
  String? input = stdin.readLineSync()!;
  switch (input) {
    case "Free":
      print("Thời gian phản hồi là 72 giờ");
      break;
    case "Pro":
      print("Thời gian phản hồi là 24 giờ");
      break;
    case "Buissness":
      print("Thời gian phản hồi là 8 giờ");
      break;
    case "Enterprise":
      print("Thời gian phản hồi là 2 giờ");
      break;
    default:
      print("Nhập lại");
  }
}
