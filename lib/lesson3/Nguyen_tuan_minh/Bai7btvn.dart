import 'dart:io';

void main() {
  print("Ưu tiên hỗ trợ (Free/Pro/Business/Enterprise)");
  var input = stdin.readLineSync();
  String? type = input;
  switch (type) {
    case "Free":
      print("Thời gian phản hồi cam kết là 72 giờ");
      break;
    case "Pro":
      print("Thời gian phản hồi cam kết là 24 giờ");
      break;
    case "Business":
      print("Thời gian phản hồi cam kết là 8 giờ");
      break;
    case "Enterprise":
      print("Thời gian phản hồi cam kết là 2 giờ");
      break;
    default:
      print("Không hợp lệ");
  }
}
