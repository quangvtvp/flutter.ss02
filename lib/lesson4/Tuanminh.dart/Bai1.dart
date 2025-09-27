// In ra N giai thừa
import "dart:io";

void main() {
  print("Nhập N:");
  var input = stdin.readLineSync();
  int? n = int.tryParse(input!);
  if (n == null || n < 0) {
    print("Không hợp lệ");
  } else {
    int gt = 1;
    for (int i = 1; i <= n; i++) {
      gt = gt * i;
    }
    print("Giai thừa của $n là $gt");
  }
}
