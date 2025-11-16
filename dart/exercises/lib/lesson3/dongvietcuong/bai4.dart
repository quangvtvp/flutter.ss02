import "dart:io";

void main() {
  print("nhap vao so tien (nghìn đồng)");
  String? input = stdin.readLineSync();
  double? sotien = double.tryParse(input ?? '');
  if (sotien != null && sotien >= 0) {
    if (sotien >= 500) {
      print("miễn phí phí vận chuyển");
    } else if (sotien >= 200) {
      print("phí vận chuyển là 15 nghìn đồng");
    } else {
      print("phí vận chuyển là 30 nghìn đồng");}
  } else {
      print("vui long nhap so tien");
    }
  }


