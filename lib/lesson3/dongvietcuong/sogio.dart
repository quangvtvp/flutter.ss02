import 'dart:io';

void main() {
  print("nhap vao so gio");
  String? input = stdin.readLineSync();
  int? sogio = int.tryParse(input ?? '');
  if (sogio != null) {
    if (sogio >= 0 && sogio <= 12) {
      print("chao buoi sang");
    } else if (sogio > 12 && sogio <= 18) {
      print("chao buoi trua");
    } else if (sogio > 18 && sogio <= 24) {
      print("chao buoi toi");
    } else {
      print("so gio khong hop le vui long nhap tu 0-24");
    }
  } else {
    print("vui long nhap so gio 0-24");
  }
}
