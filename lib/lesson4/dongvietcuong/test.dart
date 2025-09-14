import 'dart:io';
void main () {
  print ("nhap vao so giai thua");
  String? input = stdin.readLineSync();
  int? giaithua = int.tryParse(input ?? '');
  if (giaithua != null && giaithua >= 0) {
    int result = 1;
    for (int i = 1; i <= giaithua; i++) {
      result *= i;
    }
    print(" $giaithua! = $result");
  } else {
    print("vui long nhap so giai thua");
  }
}