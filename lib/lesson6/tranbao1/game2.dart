import 'dart:io';
import 'dart:math';

String veXucXac(int so) {
  // Mỗi số sẽ có một kiểu dấu chấm riêng
  switch (so) {
    case 1:
      return '''
╔═════╗
║     ║
║  ●  ║
║     ║
╚═════╝''';
    case 2:
      return '''
╔═════╗
║ ●   ║
║     ║
║   ● ║
╚═════╝''';
    case 3:
      return '''
╔═════╗
║ ●   ║
║  ●  ║
║   ● ║
╚═════╝''';
    case 4:
      return '''
╔═════╗
║ ● ● ║
║     ║
║ ● ● ║
╚═════╝''';
    case 5:
      return '''
╔═════╗
║ ● ● ║
║  ●  ║
║ ● ● ║
╚═════╝''';
    case 6:
      return '''
╔═════╗
║ ● ● ║
║ ● ● ║
║ ● ● ║
╚═════╝''';
    default:
      return '';
  }
}

void main() {
  print('Trò chơi xúc xắc trong bát!');
  print('Chọn T hoặc X, Q để thoát.');
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

    // Vẽ đĩa tròn với xúc xắc ở giữa (giả lập bằng ký tự)
    print('\n      ◯◯◯◯◯◯◯');
    print('    ◯           ◯');
    print('  ◯               ◯');
    print(' ◯                 ◯');
    print('◯                   ◯');
    print(' ◯                 ◯');
    print('  ◯               ◯');
    print('    ◯           ◯');
    print('      ◯◯◯◯◯◯◯');
    print('      Các xúc xắc trong đĩa:');
    for (var x in xucxac) {
      print(veXucXac(x));
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