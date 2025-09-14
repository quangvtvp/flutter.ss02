// Ưu tiên hỗ trợ (switch): Nhập Free/Pro/Business/Enterprise → In thời gian phản hồi cam kết: 72h/24h/8h/2h.

import 'dart:io';

void main() {
  print('Bạn là loại khách nào (Free/Pro/Business/Enterprise): ');
  String? loai = stdin.readLineSync();
  switch (loai) {
    case 'Free' || 'free':
      print('Chúng tôi sẽ phản hồi bạn muộn nhất sau 72h');
      break;
    case 'Pro' || 'pro':
      print('Chúng tôi sẽ phản hồi bạn muộn nhất sau 24h');
      break;
    case 'Business' || 'business':
      print('Chúng tôi sẽ phản hồi bạn muộn nhất sau 8h');
      break;
    case 'Enterprise' || 'enterprise':
      print('Chúng tôi sẽ phản hồi bạn muộn nhất sau 2h');
      break;
    default:
      print('vui lòng kiểm tra lại nội dung và nhập lại!');
      return main();
  }
}
