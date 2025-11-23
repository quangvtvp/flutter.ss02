import 'dart:io';

void main() {
  print("Nhap mot so khac 0:");
  var input = stdin.readLineSync();
  int? h = int.tryParse(input!);
  if (h == null || h <= 0) {
    print("Khong hop le");
  } else {
    int s = 0;
    int a = h;
    while (a > 0) {
      a = a ~/ 10;
      s = s + 1;
    }

    print("So chu so la:$s");
  }
}
