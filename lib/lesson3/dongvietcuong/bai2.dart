import 'dart:io';
void main() {
  print("nhap vao so tuoi ");
  String? input = stdin.readLineSync();
  int? tuoi = int.tryParse(input ?? '');
  if (tuoi != null && tuoi >= 0) {
    if (tuoi >= 18) {
      print("ban du dieu kien thi bang lai xe");
    } else {
      print("ban chua du dieu kien thi bang lai xe");
    }
  } else {
    print("vui long nhap so tuoi");
  }
}
