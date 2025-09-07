import 'dart:io';

void main() {
  var bool1 = true;
  var bool2 = false;
  print(bool1 || bool2);
  // F || F > F;
  print(bool1 && bool2);
  // T && T > T;
  print('Hãy nhập vào 1 số: ');
  var input = stdin.readLineSync();
  print('Số bạn vừa nhập là: $input');
  var number = int.tryParse(input!);
  if (number != null) {
    if (number % 2 == 0) {
      print('Số $number là số chẵn');
    } else {
      print('Số $number là số lẻ');
    }
  } else {
    print('Giá trị bạn nhập không phải là số');
  }
}
