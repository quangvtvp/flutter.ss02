import 'dart:io';

void main() {
  print('Bài 7: Ưu tiên hỗ trợ(swich case)');
  print('Xin chào bạn!');
  print('Nhập mức độ ưu tiên (1-4): ');
  int? mucDoUuTien = int.tryParse(stdin.readLineSync() ?? '');
  switch (mucDoUuTien) {
    case 1:
      print('Ưu tiên cao(Enterprise)');
      print('Thời gian phản hồi cam kết: 2h');
      break;
    case 2:
      print('Ưu tiên trung bình(Business)');
      print('Thời gian phản hồi cam kết: 8h');
      break;
    case 3:
      print('Ưu tiên thấp(Pro)');
      print('Thời gian phản hồi cam kết: 24h');
      break;
    case 4:
      print('Không ưu tiên(Free)');
      print('Thời gian phản hồi cam kết: 72h');
      break;
    default:
      print('Mức độ ưu tiên không hợp lệ.');
  }
}
