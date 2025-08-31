import 'dart:convert';
import 'dart:io';

void main() async {
  const String basePath = "lib/lesson1/hoang_anh_thai";
  Process? child;
  String? currentFileLabel; // ví dụ: "bai2" (không có .dart)
  final lineStream = stdin
      .transform(utf8.decoder)
      .transform(const LineSplitter());

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

    // Nếu chưa có tiến trình con -> chế độ lệnh của runner
    if (child == null) {
      if (input.isEmpty) {
        prompt();
        continue;
      }

      if (input.toLowerCase() == "exit") {
        print("👋 Runner đã thoát.");
        break;
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

      // chạy tiến trình con; runner sẽ làm proxy I/O
      final p = await Process.start("dart", [
        "run",
        path,
      ], mode: ProcessStartMode.normal);
      child = p;

      // pipe stdout/stderr của con ra console, đồng thời gom lỗi
      final StringBuffer errBuf = StringBuffer();
      p.stdout.transform(systemEncoding.decoder).listen((data) {
        stdout.write(data);
      });
      p.stderr.transform(systemEncoding.decoder).listen((data) {
        stderr.write(data);
        errBuf.write(data);
      });

      // khi con kết thúc -> in trạng thái + ghi log nếu lỗi
      p.exitCode.then((code) {
        final label = currentFileLabel ?? "run";
        if (code == 0) {
          print(
            "\n✅ File ${label}.dart đã kết thúc thành công (exitCode=$code).\n",
          );
        } else {
          print("\n💥 File ${label}.dart gặp lỗi (exitCode=$code).");
          final logPath = nextLogPath(label);
          File(logPath).writeAsStringSync(
            "=== LOG FILE ===\n"
            "File: ${label}.dart\n"
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

      // lưu ý: KHÔNG prompt() ở đây, vì đang giao tiếp với file con
      continue;
    }

    // Nếu đang có tiến trình con -> chế độ proxy input
    final lower = input.toLowerCase();
    if (lower == "stop") {
      child?.kill(); // dừng ngay
      print("⛔ File con đã bị dừng.\n");
      child = null;
      currentFileLabel = null;
      prompt();
      continue;
    }
    if (lower == "exit") {
      // thoát runner: kill con (nếu còn), rồi break
      child?.kill();
      print("👋 Runner đã thoát.");
      break;
    }

    // Forward input người dùng vào stdin của tiến trình con
    child?.stdin.writeln(raw);
    // không prompt khi con đang chạy
  }
}
