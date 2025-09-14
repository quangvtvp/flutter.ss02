import "dart:io";

void main() {
  print("Nhập chiều cao tam giác cân:");
  var input = stdin.readLineSync();
  int? h = int.tryParse(input!);
  if (h == null || h < 0) {
    print("Không hợp lệ");
  } else {
    for (int i = 1; i <= h; i++) {
      for (int k = 1; k <= h - i; k++) {
        stdout.write(" ");
      }
      for (int m = 1; m <= 2 * i - 1; m++) {
        stdout.write("*");
      }
      print("");
    }
  }
}
