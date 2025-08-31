import 'dart:io';

void main() async {
  Process? childProcess;
  final String basePath = "lib/lesson1/hoang_anh_thai";

  print("=== Runner đang chạy (bấm Ctrl+C để thoát) ===");
  print("Nhập tên file .dart trong $basePath để chạy.");
  print("Gõ 'stop' để dừng file đang chạy.");
  print("Gõ 'exit' để thoát Runner hoàn toàn.\n");

  while (true) {
    stdout.write(">> ");
    String? input = stdin.readLineSync();

    if (input == null || input.isEmpty) continue;

    if (input.toLowerCase() == "exit") {
      print("Runner đã thoát.");
      break;
    }

    if (input.toLowerCase() == "stop") {
      if (childProcess != null) {
        childProcess!.kill(ProcessSignal.sigkill);
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

    if (File(path).existsSync()) {
      if (childProcess != null) {
        print("⛔ Dừng file cũ...");
        childProcess!.kill(ProcessSignal.sigkill);
      }

      print("🚀 Đang chạy: $path ...\n");

      childProcess = await Process.start("dart", [
        "run",
        path,
      ], mode: ProcessStartMode.inheritStdio);

      childProcess!.exitCode.then((_) {
        childProcess = null;
        print("\n✅ File $input đã kết thúc.");
      });
    }
  }
}

//code by NotTie
//feat hatsune miku
//feat gpt gánh đoạn này còng lưng
