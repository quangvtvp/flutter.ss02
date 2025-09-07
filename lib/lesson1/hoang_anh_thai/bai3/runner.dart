import 'dart:convert';
import 'dart:io';

void main() async {
  const String basePath = "lib/lesson1/hoang_anh_thai/bai3";
  Process? child;
  String? currentFileLabel; // ví dụ: "bai2"
  bool stoppedByUser = false; // cờ đánh dấu stop thủ công

  final lineStream =
      stdin.transform(utf8.decoder).transform(const LineSplitter());

  void prompt() {
    if (child == null) stdout.write(">> ");
  }

  String nextLogPath(String label) {
    int i = 1;
    while (File("$basePath/${label}log$i.log").existsSync()) {
      i++;
    }
    return "$basePath/${label}log$i.log";
  }

  String ts() {
    final now = DateTime.now();
    String two(int n) => n.toString().padLeft(2, '0');
    return "${two(now.day)}/${two(now.month)}/${now.year} "
        "${two(now.hour)}:${two(now.minute)}:${two(now.second)}";
  }

  print("=== Runner đang chạy (bấm Ctrl+C để thoát) ===");
  print("Nhập tên file .dart trong $basePath để chạy.");
  print("Gõ 'stop' để dừng file đang chạy.");
  print("Gõ 'exit' để thoát Runner hoàn toàn.\n");
  prompt();

  await for (final raw in lineStream) {
    final input = raw.trim();
    final lower = input.toLowerCase();

    // Khi không có tiến trình con
    if (child == null) {
      if (input.isEmpty) {
        prompt();
        continue;
      }

      if (lower == "exit") {
        print("👋 Runner đã thoát.");
        break;
      }

      if (lower == "stop") {
        print("⚠️ Không có tiến trình nào để dừng.\n");
        prompt();
        continue;
      }

      // chuẩn hóa tên file
      var fileName = input.endsWith(".dart") ? input : "$input.dart";
      final path = "$basePath/$fileName";

      if (!File(path).existsSync()) {
        print("❌ Không tìm thấy file: $fileName");
        prompt();
        continue;
      }

      currentFileLabel = fileName.replaceAll(".dart", "");
      print("🚀 Đang chạy: $path ...\n");

      // chạy tiến trình con
      final p = await Process.start(
          "dart",
          [
            "run",
            path,
          ],
          mode: ProcessStartMode.normal);
      child = p;

      // pipe stdout/stderr
      final StringBuffer errBuf = StringBuffer();
      p.stdout.transform(utf8.decoder).listen((data) {
        stdout.write(data);
      });
      p.stderr.transform(utf8.decoder).listen((data) {
        stderr.write(data);
        errBuf.write(data);
      });

      // khi con kết thúc
      p.exitCode.then((code) {
        // Nếu do người dùng stop → không log
        if (stoppedByUser) {
          stoppedByUser = false;
          child = null;
          currentFileLabel = null;
          prompt();
          return;
        }

        final label = currentFileLabel ?? "run";
        if (code == 0) {
          print(
            "\n✅ File $label.dart đã kết thúc thành công (exitCode=$code).\n",
          );
        } else {
          print("\n💥 File $label.dart gặp lỗi (exitCode=$code).");
          final logPath = nextLogPath(label);
          File(logPath).writeAsStringSync(
            "=== LOG FILE ===\n"
            "File: $label.dart\n"
            "Thời gian: ${ts()}\n"
            "-----------------------------\n"
            "${errBuf.toString()}",
          );
          print("📄 Lỗi đã được ghi vào: $logPath\n");
        }
        child = null;
        currentFileLabel = null;
        prompt();
      });

      continue;
    }

    // Nếu đang có tiến trình con
    if (lower == "stop") {
      stoppedByUser = true;
      child?.kill(ProcessSignal.sigkill);
      print("⛔ File con đã bị dừng.\n");
      continue; // không reset child ở đây, để exitCode.then() xử lý
    }

    if (lower == "exit") {
      child?.kill();
      print("👋 Runner đã thoát.");
      break;
    }

    // Forward input cho tiến trình con
    child?.stdin.writeln(raw);
  }
}

//code by NotTie
//feat hatsune miku
//gpt gánh còng lưng đoạn này
//quá cay cú vì không thể nhập liệu trong degug console
