import 'dart:io';

void main() {
  int a = 5;
  int b = 0;
  for (int i = 0; i <= a; i++) {
    b = 2 * i - 1;
    print(" "*10+ " " * (a - i) + "*" * b);
  }
}
