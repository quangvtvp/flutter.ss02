import 'dart:io';

void main() async {
  Process? childProcess;
  const String basePath = "lib/lesson1/hoang_anh_thai";

  print("=== Runner đang chạy (bấm Ctrl+C để thoát) ===");
  print("Nhập tên file .dart trong $basePath để chạy.");
  print("Gõ 'stop' để dừng file đang chạy.");
  print("Gõ 'exit' để thoát Runner hoàn toàn.\n");

  while (true) {
    stdout.write(">> ");
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) continue;
    input = input.trim();

    // Thoát hoàn toàn
    if (input.toLowerCase() == "exit") {
      print("👋 Runner đã thoát.");
      childProcess?.kill(ProcessSignal.sigkill); // dùng ?. để an toàn
      break;
    }

    // Dừng file con
    if (input.toLowerCase() == "stop") {
      if (childProcess != null) {
        childProcess?.kill(ProcessSignal.sigkill);
        print("⛔ File con đã bị dừng.");
        childProcess = null;
      } else {
        print("⚠ Không có file nào đang chạy.");
      }
      continue;
    }

    // Nếu người dùng quên viết .dart thì tự thêm
    if (!input.endsWith(".dart")) {
      input = "$input.dart";
    }

    String path = "$basePath/$input";

    if (!File(path).existsSync()) {
      print("❌ Không tìm thấy file: $input");
      continue;
    }

    // Nếu đã có process cũ thì dừng trước khi chạy cái mới
    if (childProcess != null) {
      print("⏹ Dừng file cũ...");
      childProcess?.kill(ProcessSignal.sigkill);
      childProcess = null;
    }

    print("🚀 Đang chạy: $path ...\n");

    // Quan trọng: inheritStdio cho phép file con dùng stdin/stdout của terminal
    childProcess = await Process.start("dart", [
      "run",
      path,
    ], mode: ProcessStartMode.inheritStdio);

    // Khi file con kết thúc thì reset biến
    childProcess?.exitCode.then((code) {
      childProcess = null;
      print("\n✅ File $input đã kết thúc (exitCode=$code).");
    });
  }
}

//code by NotTie
//feat hatsune miku
//gpt gánh còng lưng
