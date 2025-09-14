import 'dart:io';

void main() {
  print("nhap vao so dung luong da dung (gb)");
  double? dungluong = double.tryParse(stdin.readLineSync() ?? '0');
  double dateFree = 3.0;
  double pricePerGB = 20000.0;
  double a = 0;
  if (dungluong != null && dungluong >= 0) {
    if (dungluong <= dateFree) {
      print("tong tien cuoc la 0 dong");
    } else {
      a = dungluong - dateFree;
      double extraRounded = (a * 10).ceil() / 10;
      int total = (extraRounded * pricePerGB).toInt();
      print("dung luong vuot qua: ${extraRounded.toStringAsFixed(1)} GB");
      print("tong tien cuoc la $total dong");
    }
  } else {
    print("vui long nhap so dung luong");
  }
}
