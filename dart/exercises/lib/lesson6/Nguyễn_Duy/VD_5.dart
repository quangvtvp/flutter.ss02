import 'dart:io';

void main() {
  var a = ['apple', 'banana', 'orange', 'grape', 'kiwi', 'mango', 'peach'];
  a.shuffle();
  var b = a[0];
  var g = b.split('');
  g.shuffle();
  print('$g');
  print('nhập số lượt chơi tối đa');
  int e = int.parse(stdin.readLineSync()!);
  print('vui lòng nhập từ cần tìm');
  String c = stdin.readLineSync()!;
  if (c == g) {
    print('đúng rồi đấy hẹ hẹ ');
  } else {
    print('sai rồi bạn êi');
    lap:
    for (int i = 0; i < e; i++) {
      print('vui lòng nhập lại từ cần tìm');
      String d = stdin.readLineSync()!;
      if (d == g) {
        print('đúng rồi đấy hẹ hẹ ');
        break lap;
      } else {
        print('sai rồi bạn êi');
        continue lap;
      }
    }
  }
}
