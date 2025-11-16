import 'dart:io';

void main() {
  for (int j = 1; j <= 9; j++) {
    for (int i = 1; i <= 9; i++) {
      stdout.write("$i x $j = ${i * j}");
      print(" ");
    }
  }
}
