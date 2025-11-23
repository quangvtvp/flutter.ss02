import 'dart:async';
import 'dart:io';
import 'dart:math';

Future<void> main() async {
  print('\n== KONICHIWA ==\n');
  print('Đoán số bí mật từ 1 đến 100:');
  stdout.writeln('');

  final secret = Random().nextInt(100);
  bool done = false;
  final completer = Completer<bool>();
  timer(10, () => done, () => done);
  stdout.writeln('\r');
  doanSo(secret).then((value) {
    done = true;
    if (!completer.isCompleted) completer.complete(true);
  });

  await completer.future;
  print('\n=== Trò chơi kết thúc ===');
}

Future<void> timer(
    int seconds, bool Function() doneCheck, bool Function() isDone) async {
  for (int i = seconds; i >= 0; i--) {
    if (isDone()) return;
    stdout.write('\x1B[4;0H');
    stdout.write('\x1B[2K');
    stdout.writeln('Thời gian còn lại: $i giây');

    await Future.delayed(Duration(seconds: 1));
  }

  if (!doneCheck()) {
    stdout.write('\x1B[4;0H');
    stdout.write('\x1B[2K');
    stdout.writeln('Thời gian còn lại: 0 giây');
    print('\n Hết giờ!');
    exit(0);
  }
}

Future<bool> doanSo(int secret) {
  final completer = Completer<bool>();
  stdin.transform(SystemEncoding().decoder).listen((input) {
    if (completer.isCompleted) return;
    input = input.trim();
    int? n = int.tryParse(input);

    if (n == null) {
      print(' Hãy nhập số hợp lệ!');
    } else if (n < secret) {
      print(' Số bạn đoán nhỏ hơn');
    } else if (n > secret) {
      print(' Số bạn đoán lớn hơn');
    } else {
      print(' Chúc mừng! Bạn đoán đúng số bí mật là $secret!');
      completer.complete(true);
    }
  });

  return completer.future;
}
