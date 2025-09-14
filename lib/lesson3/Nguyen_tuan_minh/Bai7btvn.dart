import 'dart:io';

void main() {
  print("Ưu tiên hỗ trợ (Free/Pro/Business/Enterprise)");
  var input = stdin.readLineSync();
  String? type = (input ?? "").toLowerCase();
  switch (type) {
    case "free":
      print("Thời gian phản hồi cam kết là 72 giờ");
      break;
    case "pro":
      print("Thời gian phản hồi cam kết là 24 giờ");
      break;
    case "business":
      print("Thời gian phản hồi cam kết là 8 giờ");
      break;
    case "enterprise":
      print("Thời gian phản hồi cam kết là 2 giờ");
      break;
    default:
      print("Không hợp lệ");
  }
}
