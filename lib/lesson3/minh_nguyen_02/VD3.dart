import 'dart:io';

void main() {
  print('nhap nam duoi dang so');
  var input = stdin.readLineSync();
  var nam = int.tryParse(input!);
  if (nam == null || nam < 0) {
    print('khong hop le');
    return;
  }
  if ((nam % 4 == 0 && nam % 100 != 0) || (nam % 400 == 0)) {
    print('$nam la nam nhuan');
  } else {
    print('$nam khong phai la nam nhuan');
  }
}
