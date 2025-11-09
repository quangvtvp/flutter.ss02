import 'dart:io';
import 'dart:math';

// Hằng số cấu hình
const int GRID_SIZE = 4; // Kích thước lưới (4x4)
const int BOMB_COUNT = 5; // Số lượng bom

class MinesweeperGame {
  late List<List<bool>> bombGrid; // Lưới bom ẩn (true = có bom, false = không)
  late List<List<bool>> revealedGrid; // Lưới đã lật mở
  late List<List<String>> displayGrid; // Lưới hiển thị

  int score = 0;
  bool gameOver = false;
  bool won = false;

  MinesweeperGame() {
    initGame();
  }

  // Khởi tạo game
  void initGame() {
    // Tạo lưới bom
    bombGrid = List.generate(GRID_SIZE, (_) => List.filled(GRID_SIZE, false));

    // Đặt bom ngẫu nhiên
    Random random = Random();
    int bombsPlaced = 0;
    while (bombsPlaced < BOMB_COUNT) {
      int row = random.nextInt(GRID_SIZE);
      int col = random.nextInt(GRID_SIZE);
      if (!bombGrid[row][col]) {
        bombGrid[row][col] = true;
        bombsPlaced++;
      }
    }

    // Khởi tạo lưới lật mở (tất cả ẩn)
    revealedGrid = List.generate(
      GRID_SIZE,
      (_) => List.filled(GRID_SIZE, false),
    );

    // Khởi tạo lưới hiển thị
    displayGrid = List.generate(
      GRID_SIZE,
      (_) => List.filled(GRID_SIZE, "?", growable: false),
      growable: false,
    );

    score = 0;
    gameOver = false;
    won = false;
  }

  // Hiển thị lưới game
  void displayGame() {
    print("\n╔═══════════════════╗");
    print("║  MINESWEEPER    ║");
    print("║  Score: $score/${'~' * (GRID_SIZE * GRID_SIZE - BOMB_COUNT)}  ║");
    print("╚═══════════════════╝\n");

    // In từng hàng
    for (int row = 0; row < GRID_SIZE; row++) {
      for (int col = 0; col < GRID_SIZE; col++) {
        stdout.write("┌───┐");
      }
      print("");

      for (int col = 0; col < GRID_SIZE; col++) {
        stdout.write("│ ${displayGrid[row][col]} │");
      }
      print("");

      for (int col = 0; col < GRID_SIZE; col++) {
        stdout.write("└───┘");
      }
      print("");
    }
    print("");
  }

  // Lật mở ô tại tọa độ
  bool revealCell(int row, int col) {
    // Kiểm tra tọa độ hợp lệ
    if (row < 0 || row >= GRID_SIZE || col < 0 || col >= GRID_SIZE) {
      print("❌ Tọa độ không hợp lệ! Vui lòng nhập từ 1-$GRID_SIZE");
      return false;
    }

    // Kiểm tra ô đã lật mở
    if (revealedGrid[row][col]) {
      print("⚠️  Ô này đã lật mở rồi! Hãy chọn ô khác.");
      return false;
    }

    // Lật mở ô
    revealedGrid[row][col] = true;

    // Kiểm tra có bom không
    if (bombGrid[row][col]) {
      displayGrid[row][col] = "💣";
      return false; // Có bom - game over
    } else {
      displayGrid[row][col] = "✓";
      score++;
      return true; // Không có bom - tiếp tục chơi
    }
  }

  // Lấy input từ người dùng
  List<int>? getUserInput() {
    while (true) {
      stdout.write("Nhập tọa độ (cột-hàng, ví dụ: 3-2): ");
      String? input = stdin.readLineSync();

      if (input == null || input.isEmpty) {
        print("❌ Input không hợp lệ!");
        continue;
      }

      try {
        List<String> parts = input.split("-");
        if (parts.length != 2) {
          print("❌ Vui lòng nhập theo định dạng: cột-hàng (ví dụ: 3-2)");
          continue;
        }

        int col = int.parse(parts[0].trim()) - 1;
        int row = int.parse(parts[1].trim()) - 1;

        return [row, col];
      } catch (e) {
        print("❌ Input không hợp lệ! Vui lòng nhập số.");
        continue;
      }
    }
  }

  // Kiểm tra người chơi thắng
  bool checkWin() {
    int revealedCount = 0;
    for (int row = 0; row < GRID_SIZE; row++) {
      for (int col = 0; col < GRID_SIZE; col++) {
        if (revealedGrid[row][col]) {
          revealedCount++;
        }
      }
    }
    return revealedCount == (GRID_SIZE * GRID_SIZE - BOMB_COUNT);
  }

  // Hiển thị lưới cuối cùng khi thua
  void revealAll() {
    for (int row = 0; row < GRID_SIZE; row++) {
      for (int col = 0; col < GRID_SIZE; col++) {
        if (bombGrid[row][col]) {
          displayGrid[row][col] = "💣";
        } else if (!revealedGrid[row][col]) {
          displayGrid[row][col] = "○";
        }
      }
    }
  }

  // Chạy game
  Future<void> playGame() async {
    print("🎮 Chào mừng đến với trò chơi DÒ MÌN!");
    print("📋 Luật chơi:");
    print("   - Lưới: $GRID_SIZE x $GRID_SIZE");
    print("   - Số bom: $BOMB_COUNT");
    print("   - Tìm tất cả các ô không có bom để thắng!");
    print("   - Nhập tọa độ theo định dạng: cột-hàng (ví dụ: 1-1)\n");

    await Future.delayed(Duration(seconds: 1));

    while (!gameOver && !won) {
      displayGame();

      List<int>? input = getUserInput();
      if (input != null) {
        int row = input[0];
        int col = input[1];

        if (!revealCell(row, col)) {
          gameOver = true;
          displayGame();
          print("💥 BOOM! Bạn đã踩中bom!");
          print("❌ GAME OVER! Điểm số: $score");
          revealAll();
          displayGame();
        } else {
          if (checkWin()) {
            won = true;
            displayGame();
            print("🎉 CHIẾN THẮNG! Bạn đã tìm được tất cả các ô an toàn!");
            print("🏆 Điểm số cuối cùng: $score");
          } else {
            print("✅ An toàn! Không có bom. Điểm +1");
            int remaining = (GRID_SIZE * GRID_SIZE - BOMB_COUNT) - score;
            print("📍 Còn $remaining ô cần lật mở để thắng.\n");
          }
        }
      }

      await Future.delayed(Duration(milliseconds: 500));
    }

    print("\n🔄 Bạn có muốn chơi lại không? (yes/no): ");
    stdout.write("Your answer: ");
    String? answer = stdin.readLineSync();
    if (answer != null && answer.toLowerCase() == 'yes') {
      initGame();
      await playGame();
    } else {
      print("👋 Cảm ơn đã chơi! Tạm biệt!");
    }
  }
}

Future<void> main(List<String> args) async {
  try {
    MinesweeperGame game = MinesweeperGame();
    await game.playGame();
  } catch (e) {
    print("❌ Lỗi: $e");
  }
}
