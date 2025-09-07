import 'dart:io';

void main() {
  print("nhập giờ của bạn (0-23)");
  var gio = stdin.readLineSync() ?? '';
  int gioint = int.tryParse(gio) ?? 0;
  if (gioint < 0 || gioint > 23) {
    print("giờ không hợp lệ");
  } else if (gioint < 12) {
    print("chào buổi sáng");
  } else if (gioint < 18) {
    print("chào buổi chiều");
  } else {
    print("chào buổi tối");
  }
}
