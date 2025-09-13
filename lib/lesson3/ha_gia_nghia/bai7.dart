import 'dart:io';
void main() {
  print('chon goi (free,pro,business,enterprise):');
  String? goi =stdin.readLineSync() ?? '';
  switch (goi) {
    case 'free':
    print('bạn chắc chứ? gói free,thời gian phản hồi 72h');
    break;
    case 'pro':
    print('ban chon goi pro,thoi gian phan hoi 24h');
    break;
    case 'business':
    print('ban chon goi business,thoi gian phan hoi 12h');
    break;
    case 'enterprise':
    print('ban chon goi enterprise,thoi gian phan hoi 2h');
    break;
    default:
    print('tôi có bảo bạn chọn gói này không?');
  }
}