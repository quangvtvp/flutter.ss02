import 'dart:io';

void main() {
  print("Nhập gói dịch vụ (Free/Pro/Business/Enterprise):");
  String? input = stdin.readLineSync();
  String plan = (input ?? '').toLowerCase();
  switch (plan) {
    case "free":
      print("Thời gian phản hồi cam kết: 72 giờ");
      break;
    case "pro":
      print("Thời gian phản hồi cam kết: 24 giờ");
      break;
    case "business":
      print("Thời gian phản hồi cam kết: 8 giờ");
      break;
    case "enterprise":
      print("Thời gian phản hồi cam kết: 2 giờ");
      break;
    default:
      print("Gói dịch vụ không hợp lệ!");
  }
}
