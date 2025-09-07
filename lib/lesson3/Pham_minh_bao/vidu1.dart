import 'dart:io';

void main() {
  print('nhập giờ của bạn:');
  String? input = stdin.readLineSync();
  int? time = int.tryParse(input!);
  if (time != null && (0 <= time && time < 24)) {
    if (0 <= time && time <= 12) {
      print('chào buổi sáng!');
    } else if (13 <= time && time <= 18) {
      print('chào buổi chiều!');
    } else if (18 < time && time < 24) {
      print('chào buổi tối!');
    }
  } else {
    print('giờ không hợp lệ vui lòng nhập lại!');
    return main();
  }
}
