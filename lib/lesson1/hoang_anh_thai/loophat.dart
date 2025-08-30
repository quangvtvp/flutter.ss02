import 'dart:io';
void main() {
  print("chuong trình doan tuoi thong minh");
  stdout.writeln('nhap tuoi cua ban:');
  int a =  stdin.readLineSync() as int;
  print("tuoi cua ban la: $a");
}