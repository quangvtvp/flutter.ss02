import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

Future<void> main() async {
  final random = Random();
  int secret = random.nextInt(100) + 1;
  bool guessed = false;

  print("🎯 Trò chơi đoán số (1–100)");
  print("⏳ Bạn có 30 giây để đoán đúng số bí mật!");
  print("Nhập số của bạn:");

  final inputStream = stdin.transform(utf8.decoder).transform(LineSplitter());

  // Future 1: hiệu ứng đếm ngược dấu chấm
  Future<void> countdown = () async {
    int dots = 5;
    for (int i = dots; i >= 0; i--) {
      if (guessed) return;
      String line =
          "⏳ Thời gian còn lại: ${"." * i}     "; // thêm khoảng trắng để xóa phần dư
      stdout.write("\r$line"); // in trên cùng 1 dòng
      await Future.delayed(Duration(seconds: 1));
    }
    if (!guessed) {
      stdout.write("\r❌ Hết thời gian! Số bí mật là $secret\n");
      exit(0);
    }
  }();

  // Future 2: nhập và đoán số
  inputStream.listen((line) {
    if (guessed) return;
    int? guess = int.tryParse(line.trim());
    if (guess == null) {
      print("\n⚠️ Vui lòng nhập số hợp lệ!");
      return;
    }

    if (guess == secret) {
      guessed = true;
      stdout.write("\r🎉 Chính xác! Số bí mật là $secret\n");
      exit(0);
    } else if (guess < secret) {
      print("\n📉 Số bạn đoán nhỏ hơn!");
    } else {
      print("\n📈 Số bạn đoán lớn hơn!");
    }
  });

  await countdown;
}
