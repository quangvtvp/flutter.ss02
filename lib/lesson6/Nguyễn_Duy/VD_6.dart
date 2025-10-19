import 'dart:io';

void main() {
  var a = 'Thai Nguyen';
  var b = a.split('');
  var d = b.length;
  var c = '*' * (d);
  print('$c');
  print('nhập số lượt đoán tối đa');
  int f = int.parse(stdin.readLineSync()!);
  print('vui lòng nhập từ cần đoán');
  String e = stdin.readLineSync()!;
  if (e == a) {
    print('bạn đã đoán đúng');
  } else {
    print('bạn đã đoán sai');
    for (int i = 0; i < f; i++) {
      print('vui lòng nhập lại từ cần đoán');
      String f = stdin.readLineSync()!;
      if (f == a) {
        print('bạn đã đoán đúng');
        break;
      } else {
        print('bạn đã đoán sai');
        continue;
      }
    }
  }
}
