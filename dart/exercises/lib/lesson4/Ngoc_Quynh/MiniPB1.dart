import 'dart:io';

void main() {
  print(' Vui long nhap canh hinh vuong: ');
  int? n = int.tryParse(stdin.readLineSync()!);
  if (n == null || n <= 0) {
    print(' Canh hinh vuong khong hop le');
    return;
  }
  for (int i = 1; i <= n!; i++) {
    String row = "";
    for (int j = 1; j <= n; j++) {
      if (i == n || i == 1 || j == 1 || j == n) {
        row += "*";
      } else {
        row += " ";
      }
    }

    print(row);
  }
}
