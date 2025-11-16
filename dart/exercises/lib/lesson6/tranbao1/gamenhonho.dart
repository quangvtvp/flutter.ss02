import 'dart:io';
import 'dart:math';

void main() {
  print('Trò chơi xúc xắc trong bát!');
  print('Chọn T  hoặc X , Q để thoát.');
  while (true) {
    stdout.write('Chọn T hoặc X: ');
    String? chon = stdin.readLineSync();
    if (chon == null) continue;
    chon = chon.trim().toUpperCase();
    if (chon == 'Q') break;
    if (chon != 'T' && chon != 'X') {
      print('Chỉ được chọn T hoặc X!');
      continue;
    }

    var rand = Random();
    List<int> xucxac = [
      rand.nextInt(6) + 1,
      rand.nextInt(6) + 1,
      rand.nextInt(6) + 1
    ];
    int tong = xucxac.reduce((a, b) => a + b);

    // Hiển thị xúc xắc bằng ký tự
    print('Chiếc bát mở ra:');
    for (var x in xucxac) {
      print('╔═════╗');
      print('║  $x  ║');
      print('╚═════╝');
    }
    print('Tổng: $tong');

    if (tong > 10 && chon == 'T') {
      print('Đáp án đúng!');
    } else if (tong > 10 && chon == 'X') {
      print('Đáp án sai!');
    } else if (tong <= 10 && chon == 'X') {
      print('Đáp án đúng!');
    } else {
      print('Đáp án sai!');
    }
    print('---');
  }
}