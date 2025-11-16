import 'dart:io';

void main() {
  print("Thu nhập:");
  var input = stdin.readLineSync();
  int? a = int.tryParse(input!);
  if (a == null || a < 0) {
    print("Thu nhập không hợp lệ");
  } else if (a < 11000000) {
    print("Tiền thuế TNCN là 0 VND");
  } else if (11000000 <= a && a < 20000000) {
    double b = a * 0.05;
    print("Tiền thuế TNCN là $b VND");
  } else if (20000000 < a && a <= 32000000) {
    double b = a * 0.1;
    print("Tiền thuế TNCN là $b VND");
  } else if (a > 32000000) {
    double b = a * 0.2;
    print("Tiền thuế TNCN là $b VND");
  }
}
