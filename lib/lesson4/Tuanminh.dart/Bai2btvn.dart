import 'dart:io';

void main() {
  print("Nhap chieu cao tam giac can rong:");
  var input = stdin.readLineSync();
  int? h = int.tryParse(input!);
  if (h == null || h < 0) {
    print("Khong hop le");
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
