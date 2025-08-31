import 'dart:io';

void main() async {
  const String basePath = "lib/lesson1/hoang_anh_thai";

  print("=== Runner đang chạy (bấm Ctrl+C để thoát) ===");
  print("Nhập tên file .dart trong $basePath để chạy.");
  print("Gõ 'exit' để thoát Runner hoàn toàn.\n");

  while (true) {
    stdout.write(">> ");
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) continue;
    input = input.trim();

    if (input.toLowerCase() == "exit") {
      print("👋 Runner đã thoát.");
      break;
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

    print("🚀 Đang chạy: $path ...\n");

    // Chạy file con và dùng stdin của terminal (inheritStdio)
    final process = await Process.start("dart", [
      "run",
      path,
    ], mode: ProcessStartMode.inheritStdio);

    // ⚡ Chờ file con kết thúc xong mới quay lại vòng lặp
    final exitCode = await process.exitCode;

    print("\n✅ File $input đã kết thúc (exitCode=$exitCode).\n");
  }
}
