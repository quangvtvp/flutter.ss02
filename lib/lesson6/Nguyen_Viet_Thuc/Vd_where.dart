import 'dart:io';

void main() {
  List<int> numbers = [21, 32, 42, 55, 10, 35, 23, 5];
  print("Danh sách: $numbers");

  stdout.write("Các số chia hết cho 5: ");
  List<int> chiahetcho5 = numbers.where((d) => d % 5 == 0).toList();
  chiahetcho5.forEach((d) => stdout.write("$d "));
}
