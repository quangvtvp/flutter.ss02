import 'dart:io';

Future<void> main(List<String> args) async {
  await Future.any([tudung(), thoigian()]);
}

Future<void> tudung() async {
  List<String> games = ['chess', 'poker', 'xocdia', 'bau cua'];
  String secretGame = (List.from(games)..shuffle()).first;
  // Hiện dấu ... giả lập chờ
  for (var i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 1));
    stdout.write('.');
  }
  print('\nĐã sẵn sàng!');
  while (true) {
    stdout.write('Bạn đoán game gì: ');
    String? guess = stdin.readLineSync();
    if (guess != null && guess.trim().isNotEmpty) {
      if (guess.trim().toLowerCase() == secretGame.toLowerCase()) {
        print('Bạn đoán đúng rồi! (đáp án: $secretGame)');
        break;
      } else {
        print('Bạn đoán sai, thử lại.');
      }
    }
  }
}

Future<void> thoigian() async {
  stdout.write('Bắt đầu đếm ngược: ');
  for (var i = 5; i >= 1; i--) {
    String dots = List.filled(i, '.').join();
    stdout.write('$dots ');
    await Future.delayed(Duration(seconds: 1));
  }
  print('\nHết giờ!');
}
