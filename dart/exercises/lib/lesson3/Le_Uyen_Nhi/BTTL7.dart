import 'dart:io';

void main() {
  print('Nhập gói hỗ trợ (Free/Pro/Business/Enterprise): ');
  String? input = stdin.readLineSync()?.toLowerCase();

  switch (input) {
    case 'free':
      print('Thời gian phản hồi: 72h');
      break;
    case 'pro':
      print('Thời gian phản hồi: 24h');
      break;
    case 'business':
      print('Thời gian phản hồi: 8h');
      break;
    case 'enterprise':
      print('Thời gian phản hồi: 2h');
      break;
    default:
      print('Gói hỗ trợ không hợp lệ.');
  }
}
