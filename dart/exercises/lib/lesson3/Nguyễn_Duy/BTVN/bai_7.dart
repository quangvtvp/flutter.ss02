import 'dart:io';

void main() {
  print('nhập bậc của bạn :');
  var bac = stdin.readLineSync() ?? '';
  switch (bac) {
    case 'Free' || 'free':
      print('thời gian phản hồi cam kết là 72 giờ');
      break;
    case 'Pro' || 'pro':
      print('thời gian phản hồi cam kết là 24 giờ');
      break;
    case 'Business' || 'business':
      print('thời gian phản hồi cam kết là 8 giờ');
      break;
    case 'Enterprise' || 'enterprise':
      print('thời gian phản hồi cam kết là 2 giờ');
      break;
    default:
      print('bậc không hợp lệ');
  }
}
